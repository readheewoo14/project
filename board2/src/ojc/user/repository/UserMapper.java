package ojc.user.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ojc.user.model.User;

/*
 * 로그인 정보 CRUD 쿼리
 * */
@Mapper
public interface UserMapper {
	@Insert("INSERT INTO EMP_INFO(EMP_ID, password) VALUES(#{empId}, #{password})")
	public int insert(User user);

	@Update("UPDATE EMP_INFO SET password = #{password} WHERE EMP_ID = #{empId}")
	public int update(User user);

	@Delete("DELETE FROM EMP_INFO WHERE EMP_ID = #{empId}")
	public int delete(String empId);

	@Select("SELECT COUNT(*) FROM EMP_INFO")
	public int count();

	@Select("SELECT * FROM EMP_INFO ORDER BY EMP_ID ASC")
	@ResultType(User.class) 
	public List<User> selectAll();

	@Select("SELECT * FROM EMP_INFO WHERE EMP_ID = #{empId}")

	@Results(id = "userResultMap", value = { 
			@Result(property = "empId", column = "empId"),
			@Result(property = "password", column = "password") })
	public User selectByEmpId(String empId);
}
