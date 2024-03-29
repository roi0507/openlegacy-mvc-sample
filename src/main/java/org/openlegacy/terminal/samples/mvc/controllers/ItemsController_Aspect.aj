// WARNING: DO NOT EDIT THIS FILE.
// You may push code into the target .java compilation unit if you wish to edit any member(s).
package org.openlegacy.terminal.samples.mvc.controllers;

import java.io.IOException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openlegacy.modules.table.Table;
import org.openlegacy.modules.table.TableWriter;
import org.openlegacy.terminal.ScreenEntity;
import org.openlegacy.terminal.TerminalSession;
import org.openlegacy.terminal.actions.TerminalActions;
import org.openlegacy.terminal.samples.model.Items;
import org.openlegacy.terminal.services.ScreenEntitiesRegistry;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import flexjson.JSONSerializer;

privileged @SuppressWarnings("unused") aspect ItemsController_Aspect {

	private final static Log logger = LogFactory.getLog(ItemsController.class);
	
	@Inject
	private TerminalSession ItemsController.terminalSession;

	@Inject
	private ScreenEntitiesRegistry ItemsController.screenEntitiesRegistry;

	@Inject
	private TableWriter ItemsController.tableWriter;
	
	// handle page initial display
    @RequestMapping(method = RequestMethod.GET)
    public String ItemsController.show(Model uiModel) {
    	Items items = terminalSession.getEntity(Items.class);
	uiModel.addAttribute("items", items);
	// show the resulting page for Items
        return "Items";
    }

    @RequestMapping(value="/help", method = RequestMethod.GET)
    public @ResponseBody String ItemsController.systemHelp(HttpServletRequest request) throws IOException {
    	URL resource = request.getSession().getServletContext().getResource("/help/Items.html");
    	String result = "";
    	if (resource != null){
    		result = IOUtils.toString(resource.openStream());
    	}
    	return result;
    }
    
	// handle submit action
    @RequestMapping(method = RequestMethod.POST)
    public String ItemsController.submit(Items items, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.ENTER(), items);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				items = terminalSession.getEntity(Items.class);
		    	uiModel.addAttribute("items", items);
		        return "Items";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
    
	// handle help action
    @RequestMapping(params="action=help", method = RequestMethod.POST)
    public String ItemsController.help(Items items, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F1(), items);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				items = terminalSession.getEntity(Items.class);
		    	uiModel.addAttribute("items", items);
		        return "Items";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle exit action
    @RequestMapping(params="action=exit", method = RequestMethod.POST)
    public String ItemsController.exit(Items items, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F3(), items);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				items = terminalSession.getEntity(Items.class);
		    	uiModel.addAttribute("items", items);
		        return "Items";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle create action
    @RequestMapping(params="action=create", method = RequestMethod.POST)
    public String ItemsController.create(Items items, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F6(), items);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				items = terminalSession.getEntity(Items.class);
		    	uiModel.addAttribute("items", items);
		        return "Items";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle cancel action
    @RequestMapping(params="action=cancel", method = RequestMethod.POST)
    public String ItemsController.cancel(Items items, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F12(), items);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				items = terminalSession.getEntity(Items.class);
		    	uiModel.addAttribute("items", items);
		        return "Items";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle numberSeq action
    @RequestMapping(params="action=numberSeq", method = RequestMethod.POST)
    public String ItemsController.numberSeq(Items items, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F6(), items);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				items = terminalSession.getEntity(Items.class);
		    	uiModel.addAttribute("items", items);
		        return "Items";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle previous action
    @RequestMapping(params="action=previous", method = RequestMethod.POST)
    public String ItemsController.previous(Items items, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.PAGEUP(), items);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				items = terminalSession.getEntity(Items.class);
		    	uiModel.addAttribute("items", items);
		        return "Items";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle next action
    @RequestMapping(params="action=next", method = RequestMethod.POST)
    public String ItemsController.next(Items items, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.PAGEDOWN(), items);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				items = terminalSession.getEntity(Items.class);
		    	uiModel.addAttribute("items", items);
		        return "Items";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }

	// export to excel
    @RequestMapping(value="/excel", method = RequestMethod.GET)
    public void ItemsController.excel(HttpServletResponse response) throws IOException {
    	List<Items.ItemsRecord> records = terminalSession.getModule(Table.class).collectOne(Items.class,Items.ItemsRecord.class);
		response.setContentType("application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment; filename=\"ItemsRecord.xls\"");
    	tableWriter.writeTable(records, response.getOutputStream());
    }
    
	@RequestMapping(value = "/more", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> ItemsController.more() {
		Items items = terminalSession.getEntity(Items.class);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/text; charset=utf-8");

		try{
			items = terminalSession.doAction(TerminalActions.PAGEDOWN(), items);
			String result = new JSONSerializer().serialize(items.getItemsRecords());
			return new ResponseEntity<String>(result, headers, HttpStatus.OK);
		}
		catch(Exception e){
			logger.error("Next screen after PAGEDOWN is not items");
			return new ResponseEntity<String>("", headers, HttpStatus.OK);
		}

	}	
	
	@InitBinder
	public void ItemsController.initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
}
