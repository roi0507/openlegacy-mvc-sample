// WARNING: DO NOT EDIT THIS FILE.
// You may push code into the target .java compilation unit if you wish to edit any member(s).
package org.openlegacy.terminal.samples.mvc.controllers;

import java.util.*;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.openlegacy.terminal.samples.model.*;

import java.text.SimpleDateFormat;
import org.springframework.beans.propertyeditors.CustomDateEditor;

import org.openlegacy.terminal.ScreenEntity;
import org.openlegacy.terminal.TerminalSession;
import org.openlegacy.terminal.actions.TerminalActions;
import org.openlegacy.terminal.services.ScreenEntitiesRegistry;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.WebDataBinder;

import org.openlegacy.terminal.samples.model.ItemDetails2;

privileged @SuppressWarnings("unused") aspect ItemDetails2Controller_Aspect {

	@Inject
	private TerminalSession ItemDetails2Controller.terminalSession;

	@Inject
	private ScreenEntitiesRegistry ItemDetails2Controller.screenEntitiesRegistry;

	// handle page initial display
    @RequestMapping(method = RequestMethod.GET, params="partial=1")
    public String ItemDetails2Controller.show(Model uiModel) {
    	ItemDetails2 itemDetails2 = terminalSession.getEntity(ItemDetails2.class);
	uiModel.addAttribute("itemDetails2", itemDetails2);
	// show the resulting page for ItemDetails2
        return "ItemDetails2";
    }

	// handle submit action
    @RequestMapping(method = RequestMethod.POST)
    public String ItemDetails2Controller.submit(ItemDetails2 itemDetails2, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.ENTER(), itemDetails2);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				itemDetails2 = terminalSession.getEntity(ItemDetails2.class);
		    	uiModel.addAttribute("itemDetails2", itemDetails2);
		        return "ItemDetails2";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
    
	// handle help action
    @RequestMapping(params="action=help", method = RequestMethod.POST)
    public String ItemDetails2Controller.help(ItemDetails2 ItemDetails2, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F1(), ItemDetails2);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				ItemDetails2 = terminalSession.getEntity(ItemDetails2.class);
		    	uiModel.addAttribute("itemDetails2", ItemDetails2);
		        return "ItemDetails2";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle cancel action
    @RequestMapping(params="action=cancel", method = RequestMethod.POST)
    public String ItemDetails2Controller.cancel(ItemDetails2 ItemDetails2, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F3(), ItemDetails2);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				ItemDetails2 = terminalSession.getEntity(ItemDetails2.class);
		    	uiModel.addAttribute("itemDetails2", ItemDetails2);
		        return "ItemDetails2";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle prompt action
    @RequestMapping(params="action=prompt", method = RequestMethod.POST)
    public String ItemDetails2Controller.prompt(ItemDetails2 itemDetails2, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F4(), itemDetails2);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				itemDetails2 = terminalSession.getEntity(ItemDetails2.class);
		    	uiModel.addAttribute("itemDetails2", itemDetails2);
		        return "ItemDetails2";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle return_ action
    @RequestMapping(params="action=return_", method = RequestMethod.POST)
    public String ItemDetails2Controller.return_(ItemDetails2 ItemDetails2, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F12(), ItemDetails2);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				ItemDetails2 = terminalSession.getEntity(ItemDetails2.class);
		    	uiModel.addAttribute("itemDetails2", ItemDetails2);
		        return "ItemDetails2";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle delete action
    @RequestMapping(params="action=delete", method = RequestMethod.POST)
    public String ItemDetails2Controller.delete(ItemDetails2 itemDetails2, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F2(), itemDetails2);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				itemDetails2 = terminalSession.getEntity(ItemDetails2.class);
		    	uiModel.addAttribute("itemDetails2", itemDetails2);
		        return "ItemDetails2";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	
	
	@InitBinder
	public void ItemDetails2Controller.initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
}
