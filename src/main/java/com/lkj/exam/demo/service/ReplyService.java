package com.lkj.exam.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lkj.exam.demo.repository.ReplyRepository;
import com.lkj.exam.demo.util.Ut;
import com.lkj.exam.demo.vo.Article;
import com.lkj.exam.demo.vo.Reply;
import com.lkj.exam.demo.vo.ResultData;

@Service
public class ReplyService {
	@Autowired
	private ReplyRepository replyRepository;
	
	public ReplyService(ReplyRepository replyRepository) {
		
		this.replyRepository = replyRepository;
	}
	
	public ResultData<Integer> writeReply(int actorId, String relTypeCode, int relId, String body) {
		
		replyRepository.writeReply(actorId, relTypeCode, relId, body);
		
		int id = replyRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 댓글이 등록되었습니다", id), "id", id);
	}

	public List<Reply> getFroPrintReplies(int actorId, String relTypeCode, int relId) {
		return replyRepository.getFroPrintReplies(actorId, relTypeCode, relId);
	}

	public Reply getForPrintReply(int actorId, String relTypeCode, int relId, int id) {
		
		Reply reply =  replyRepository.getForPrintReply(actorId, relTypeCode, relId, id);
		
		updateForPrintData(actorId, reply);
		
		return reply;
	}
	
	private void updateForPrintData(int actorId, Reply reply) {
		
		if (reply == null) {
			return;
		}
		
		ResultData actorCanDeleteRd = actorCanDelete(actorId, reply);
		reply.setExtra__actorCanDelete(actorCanDeleteRd.isSuccess());
		
		ResultData actorCanModifyRd = actorCanModify(actorId, reply);
		reply.setExtra__actorCanModify(actorCanModifyRd.isSuccess());
	}

	public ResultData actorCanModify(int actorId, Reply reply) {

		if (reply.getMemberId() != actorId) {
			return ResultData.from("F-2", "해당 게시물에 대한 권한이 없습니다.");
		}
		
		return ResultData.from("S-1", "수정 가능");

	}
	
	public ResultData actorCanDelete(int actorId, Reply reply) {
		
		if (reply.getMemberId() != actorId) {
			return ResultData.from("F-2", "해당 게시물에 대한 권한이 없습니다.");
		}
		
		return ResultData.from("S-1", "수정 가능");
	}

	public void deleteReply(String relTypeCode, int relId, int id) {
		replyRepository.deleteReply(relTypeCode, relId, id);
	}

	public ResultData<Reply> modifyReply(int actorId, String relTypeCode, int relId, String body, int id) {
		
		replyRepository.modifyReply(relTypeCode, relId, body, id);
		
		Reply reply =  getForPrintReply(actorId, relTypeCode, relId, id);
		
		return ResultData.from("S-1", Ut.f("%d번 댓글을 수정했습니다.", id), "reply", reply);
		
	}
	
}
