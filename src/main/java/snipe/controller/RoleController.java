package snipe.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import snipe.business.service.RoleServiceI;
import snipe.mybatis.model.Role;
import snipe.pageModel.RoleDto;
import snipe.pageModel.base.SessionInfo;
import snipe.pageModel.easyUI.Json;
import snipe.pageModel.easyUI.Tree;
import snipe.util.ConfigUtil;

/**
 * 角色控制器
 * 
 * @author 孙宇
 * 
 */
@Controller
@RequestMapping("/roleController")
public class RoleController extends BaseController {

	@Autowired
	private RoleServiceI roleService;

	/**
	 * 跳转到角色管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager() {
		return "/admin/role/role";
	}

	/**
	 * 跳转到角色添加页面
	 * 
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		Role r = new Role();
		r.setId(UUID.randomUUID().toString());
		request.setAttribute("role", r);
		return "/admin/role/roleAdd";
	}

	/**
	 * 添加角色
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(RoleDto role, HttpSession session) {
		SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
		Json j = new Json();
		roleService.add(role, sessionInfo);
		j.setSuccess(true);
		j.setMsg("添加成功！");
		return j;
	}

	/**
	 * 跳转到角色修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String id) {
		RoleDto r = roleService.getRoleById(id);
		request.setAttribute("role", r);
		return "/admin/role/roleEdit";
	}

	/**
	 * 修改角色
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(RoleDto role) {
		Json j = new Json();
		roleService.edit(role);
		j.setSuccess(true);
		j.setMsg("编辑成功！");
		return j;
	}

	/**
	 * 获得角色列表
	 * 
	 * @return
	 */
	@RequestMapping("/treeGrid")
	@ResponseBody
	public List<RoleDto> treeGrid(HttpSession session) {
		SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
		return roleService.treeGrid(sessionInfo);
	}

	/**
	 * 角色树(只能看到自己拥有的角色)
	 * 
	 * @return
	 */
	@RequestMapping("/tree")
	@ResponseBody
	public List<Tree> tree(HttpSession session) {
		SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
		return roleService.tree(sessionInfo);
	}

	/**
	 * 角色树
	 * 
	 * @return
	 */
	@RequestMapping("/allTree")
	@ResponseBody
	public List<Tree> allTree() {
		return roleService.allTree();
	}

	/**
	 * 删除角色
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String id) {
		Json j = new Json();
		roleService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

	/**
	 * 跳转到角色授权页面
	 * 
	 * @return
	 */
	@RequestMapping("/grantPage")
	public String grantPage(HttpServletRequest request, String id) {
		RoleDto r = roleService.getRoleById(id);
		request.setAttribute("role", r);
		return "/admin/role/roleGrant";
	}

	/**
	 * 授权
	 * 
	 * @param role
	 * @return
	 */
	@RequestMapping("/grant")
	@ResponseBody
	public Json grant(RoleDto roledto) {
		Json j = new Json();
 		roleService.grant(roledto);
		j.setMsg("授权成功！");
		j.setSuccess(true);
		return j;
	}

}
