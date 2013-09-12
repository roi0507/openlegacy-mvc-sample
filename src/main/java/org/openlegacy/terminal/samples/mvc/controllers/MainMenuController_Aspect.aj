// WARNING: DO NOT EDIT THIS FILE.
// You may push code into the target .java compilation unit if you wish to edit any member(s).
package org.openlegacy.terminal.samples.mvc.controllers;

import java.util.*;
import javax.inject.Inject;
import javax.print.attribute.standard.Media;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.openlegacy.terminal.samples.model.*;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
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

import org.openlegacy.terminal.samples.model.MainMenu;

privileged @SuppressWarnings("unused") aspect MainMenuController_Aspect {

	@Inject
	private TerminalSession MainMenuController.terminalSession;

	@Inject
	private ScreenEntitiesRegistry MainMenuController.screenEntitiesRegistry;

	// handle page initial display
    @RequestMapping(method = RequestMethod.GET)
    public String MainMenuController.show(Model uiModel) {
    	MainMenu mainMenu = terminalSession.getEntity(MainMenu.class);
	uiModel.addAttribute("MainMenu", mainMenu);
	// show the resulting page for MainMenu
        return "MainMenu";
    }

    @RequestMapping(value="/help", method = RequestMethod.GET)
    public @ResponseBody String MainMenuController.systemHelp(HttpServletRequest request) throws IOException {
    	URL resource = request.getSession().getServletContext().getResource("/help/MainMenu.html");
    	String result = IOUtils.toString(resource.openStream());
    	return result;
    }
    
	// handle submit action
    @RequestMapping(method = RequestMethod.POST)
    public String MainMenuController.submit(MainMenu mainMenu, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.ENTER(), mainMenu);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				mainMenu = terminalSession.getEntity(MainMenu.class);
		    	uiModel.addAttribute("MainMenu", mainMenu);
		        return "MainMenu";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
    
	// handle help action
    @RequestMapping(params="action=help", method = RequestMethod.POST)
    public String MainMenuController.help(MainMenu mainMenu, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F1(), mainMenu);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				mainMenu = terminalSession.getEntity(MainMenu.class);
		    	uiModel.addAttribute("mainMenu", mainMenu);
		        return "MainMenu";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle exit action
    @RequestMapping(params="action=exit", method = RequestMethod.POST)
    public String MainMenuController.exit(MainMenu mainMenu, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F3(), mainMenu);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				mainMenu = terminalSession.getEntity(MainMenu.class);
		    	uiModel.addAttribute("mainMenu", mainMenu);
		        return "MainMenu";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle prompt action
    @RequestMapping(params="action=prompt", method = RequestMethod.POST)
    public String MainMenuController.prompt(MainMenu mainMenu, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F4(),mainMenu);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				mainMenu = terminalSession.getEntity(MainMenu.class);
		    	uiModel.addAttribute("mainMenu", mainMenu);
		        return "MainMenu";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle prev action
    @RequestMapping(params="action=prev", method = RequestMethod.POST)
    public String MainMenuController.prev(MainMenu mainMenu, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F12(), mainMenu);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				mainMenu = terminalSession.getEntity(MainMenu.class);
		    	uiModel.addAttribute("mainMenu", mainMenu);
		        return "MainMenu";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	// handle command action
    @RequestMapping(params="action=command", method = RequestMethod.POST)
    public String MainMenuController.command(MainMenu mainMenu, Model uiModel, HttpServletRequest httpServletRequest) {
	ScreenEntity resultScreenEntity = terminalSession.doAction(TerminalActions.F9(), mainMenu);
	// go to the controller for the resulting screen name
		if (resultScreenEntity != null){
			String screenEntityName = screenEntitiesRegistry.get(resultScreenEntity.getClass()).getEntityClassName();
			if (httpServletRequest.getParameter("partial") != null){
				mainMenu = terminalSession.getEntity(MainMenu.class);
		    	uiModel.addAttribute("mainMenu", mainMenu);
		        return "MainMenu";
			}
        	return "redirect:" + screenEntityName;
		}
    	return "redirect:/";
		
    }
	
	
	@InitBinder
	public void MainMenuController.initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
}
