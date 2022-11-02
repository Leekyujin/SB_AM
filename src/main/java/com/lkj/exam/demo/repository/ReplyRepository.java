package com.lkj.exam.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lkj.exam.demo.vo.Reply;

@Mapper
public interface ReplyRepository {

	@Insert("""
			<script>
				INSERT INTO reply
				SET regDate = NOW(),
				updateDate = NOW(),
				memberId = #{memberId},
				relTypeCode = #{relTypeCode},
				relId = #{relId},
				`body` = #{body}
			</script>
			""")
	public void writeReply(int memberId, String relTypeCode, int relId, String body);

	@Select("""
			<script>
				SELECT LAST_INSERT_ID()
			</script>
			""")
	public int getLastInsertId();

	@Select("""
			<script>
				SELECT R.*, M.nickname AS extra__writerName
				FROM reply AS R
				LEFT JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.relTypeCode = #{relTypeCode}
				AND R.relId = #{relId}
				ORDER BY R.id ASC
			</script>
			""")
	public List<Reply> getFroPrintReplies(String relTypeCode, int relId);

	@Select("""
			<script>
				SELECT R.*, M.nickname AS extra__writerName
				FROM reply AS R
				LEFT JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.id = #{id }
			</script>
			""")
	public Reply getForPrintReply(int id);

	@Delete("""
			<script>
				DELETE FROM reply 
				WHERE id = #{id }
			</script>
			""")
	public void deleteReply(int id);

	@Update("""
			<script>
				UPDATE reply 
				<set>
					<if test="body != null and body != ''">`body` = #{body},</if> 
					updateDate = NOW() 
				</set>
				WHERE AND id = #{id }
			</script>
			""")
	public void modifyReply(String body, int id);

}
