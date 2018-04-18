package controller;

import controller.action.Action;
import controller.action.BillingAction;
import controller.action.BuyTicketAction;
import controller.action.IndexAction;
import controller.action.StatusAction;
import controller.action.TimeAction;

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
		else if(command.equals("status")) {
			action = new StatusAction();
		}
		else if(command.equals("time")) {
			action = new TimeAction();
		}
		else if(command.equals("billing")) {
			action = new BillingAction();
		}
		else if(command.equals("buyTicket")) {
			action = new BuyTicketAction();
		}
		return action;
	}
}
