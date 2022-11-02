package com.lkj.exam.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkj.exam.demo.service.ReplyService;
import com.lkj.exam.demo.util.Ut;
import com.lkj.exam.demo.vo.Member;
import com.lkj.exam.demo.vo.Reply;
import com.lkj.exam.demo.vo.ResultData;
import com.lkj.exam.demo.vo.Rq;

@Controller
public class UsrReplyController {
	
	@Autowired
	private ReplyService replyService;
	@Autowired
	private Rq rq;
	
	@RequestMapping("/usr/reply/doWrite")
	@ResponseBody
	public String doWrite(String relTypeCode, int relId, String body, String replaceUri) {

		if (Ut.empty(relTypeCode)) {
			return rq.jsHistoryBack("relTypeCode을(를) 입력해주세요");
		}

		if (Ut.empty(relId)) {
			return rq.jsHistoryBack("relId을(를) 입력해주세요");
		}

		if (Ut.empty(body)) {
			return rq.jsHistoryBack("body을(를) 입력해주세요");
		}

		ResultData<Integer> writeReplyRd = replyService.writeReply(rq.getLoginedMemberId(), relTypeCode, relId, body);

		int id = writeReplyRd.getData1();

		if (Ut.empty(replaceUri)) {
			switch (relTypeCode) {
			case "article":
				replaceUri = Ut.f("../article/detail?id=%d", relId);
				break;
			}
		}

		return rq.jsReplace(writeReplyRd.getMsg(), replaceUri);
	}
	
	@RequestMapping("/usr/reply/modify")
	public String showModify(Model model, int id, String relTypeCode, int relId) {
		
		Reply reply = replyService.getForPrintReply(rq.getLoginedMember(), id, relTypeCode, relId);
		
		if (reply == null) {
			return rq.jsHistoryBackOnView(Ut.f("%d번 댓글은 존재하지 않습니다.", id));
		}
		
		ResultData actorCanModifyRd = replyService.actorCanModify(rq.getLoginedMember(), reply);
		
		if (actorCanModifyRd.isFail()) {
			return rq.jsHistoryBackOnView(actorCanModifyRd.getMsg());
		}
		
		model.addAttribute("reply", reply);
		
		return "usr/article/modify";
	}
	
	@RequestMapping("/usr/reply/doModify")
	@ResponseBody
	public String doModify(Member member, int id, String relTypeCode, int relId, String body) {
		
		Reply reply = replyService.getForPrintReply(rq.getLoginedMember(), id, relTypeCode, relId);
		
		if (reply == null) {
			return rq.jsHistoryBack(Ut.f("%d번 댓글은 존재하지 않습니다.", id));
		}
		
		ResultData actorCanModifyRd = replyService.actorCanModify(rq.getLoginedMember(), reply);
		
		if (actorCanModifyRd.isFail()) {
			return rq.jsHistoryBack(actorCanModifyRd.getMsg());
		}
		
		replyService.modifyReply(member, relTypeCode, relId, body, id);
		
		return rq.jsReplace(Ut.f("%d번 댓글을 수정했습니다.", id), Ut.f("../article/detail?id=%d", relId));
	}
	
	@RequestMapping("/usr/reply/doDelete")
	@ResponseBody
	public String doDelete(int id, String relTypeCode, int relId) {
		
		Reply reply = replyService.getForPrintReply(rq.getLoginedMember(), id, relTypeCode, relId);
		
		if (reply == null) {
			return rq.jsHistoryBack(Ut.f("%d번 댓글은 존재하지 않습니다.", id));
		}
		
		if (reply.getMemberId() != rq.getLoginedMemberId()) {
			return rq.jsHistoryBack(Ut.f("%d번 댓글에 대한 권한이 없습니다.", id));
		}
		
		replyService.deleteReply(relTypeCode, relId, id);
		
		return rq.jsReplace(Ut.f("%d번 댓글을 삭제했습니다.", id), "../article/list?boardId=1");
	}
	
}
