package com.lkj.exam.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkj.exam.demo.service.ArticleService;
import com.lkj.exam.demo.util.Ut;
import com.lkj.exam.demo.vo.Article;
import com.lkj.exam.demo.vo.ResultData;

@Controller
public class UsrArticleController {
	// 인스턴스 변수
	@Autowired
	private ArticleService articleService;

	// 액션 메서드
	@RequestMapping("/usr/article/doAdd")
	@ResponseBody
	public ResultData<Article> doAdd(String title, String body) {
		if (Ut.empty(title)) {
			return ResultData.from("F-2", "제목을 입력해주세요.");
		}
		if (Ut.empty(body)) {
			return ResultData.from("F-3", "내용을 입력해주세요.");
		}
		
		ResultData<Integer> writeArticleRd = articleService.writeArticle(title, body);
		
		Article article = articleService.getArticle((int) writeArticleRd.getData1());
		
		return ResultData.newData(writeArticleRd, article);
	}
	
	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public ResultData<List<Article>> getArticles() {
		List<Article> articles = articleService.getArticles();
		
		return ResultData.from("S-2", "Article List", articles);
	}
	
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData<Integer> doDelete(int id) {
		Article article = articleService.getArticle(id);
		
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물은 존재하지 않습니다.", id), id);
		}
		
		articleService.deleteArticle(id);
		
		return ResultData.from("S-1", Ut.f("%d번 게시물은 삭제했습니다.", id), id);
	}
	
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Integer> doModify(int id, String title, String body) {
		Article article = articleService.getArticle(id);
		
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물은 존재하지 않습니다.", id), id);
		}
		
		articleService.modifyArticle(id, title, body);
		
		article = articleService.getArticle(id);
		
		return ResultData.from("S-1", Ut.f("%d번 게시물은 수정했습니다.", id), id);
	}
	
	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData<Article> getArticle(int id) {
		Article article = articleService.getArticle(id);
		
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물은 존재하지 않습니다.", id));
		}
		
		return ResultData.from("S-1", Ut.f("%d번 게시물입니다.", id), article);
	}

}
