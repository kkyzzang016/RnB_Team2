package controller;

import controller.action.Action;
import controller.action.IndexAction;

public class ActionFactory {

	private static ActionFactory instance = new ActionFactory();

	public ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory :" + command);

		if (command.equals("main")) {
			action = new IndexAction();
		}

		return action;
	}
}
