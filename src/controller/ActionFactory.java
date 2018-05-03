package controller;

import controller.action.Action;
import controller.action.IndexAction;
import controller.action.commterTicket.BuyTicketAction;
import controller.action.commterTicket.PayCertificateAction;
import controller.action.commterTicket.PayCompleteAction;
import controller.action.commterTicket.PurchaseConfirmAction;
import controller.action.contact.ContactAction;
import controller.action.contact.GoContactAction;
import controller.action.reservation.CheckZeroSpareAction;
import controller.action.reservation.LotsCountDeleteAction;
import controller.action.reservation.ReserveInsertAction;
import controller.action.reservation.ReservationAction;
import controller.action.reservation.ReserveConfirmAction;
import controller.action.status.BillingAction;
import controller.action.status.BillingDiscountAction;
import controller.action.status.CheckTicketAction;
import controller.action.status.PayFeeCompleteAction;
import controller.action.status.StatusAction;
import controller.action.status.TimeAction;
import controller.action.user.AddUserAction;
import controller.action.user.ConfirmIdAction;
import controller.action.user.GoConfirmIdAction;
import controller.action.user.LoginAction;
import controller.action.user.LogoutAction;
import controller.action.user.SignInAction;
import controller.action.user.SignUpAction;
import controller.action.user.UsageDetailsAction;

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

		} else if (command.equals("status")) {
			action = new StatusAction();

		} else if (command.equals("time")) {
			action = new TimeAction();

		} else if (command.equals("billing")) {
			action = new BillingAction();

		} else if (command.equals("buyTicket")) {
			action = new BuyTicketAction();

		} else if (command.equals("purchaseConfirm")) {
			action = new PurchaseConfirmAction();

		} else if (command.equals("contact")) {
			action = new ContactAction();

		} else if (command.equals("goContact")) {
			action = new GoContactAction();

		} else if (command.equals("reservation")) {
			action = new ReservationAction();

		} else if (command.equals("reserveConfirm")) {
			action = new ReserveConfirmAction();

		} else if (command.equals("reserveInsert")) {
			action = new ReserveInsertAction();

		} else if (command.equals("lotsCountDelete")) {
			action = new LotsCountDeleteAction();

		} else if (command.equals("signUp")) {
			action = new SignUpAction();

		} else if (command.equals("signIn")) {
			action = new SignInAction();

		} else if (command.equals("confirmId")) {
			action = new ConfirmIdAction();

		} else if (command.equals("goConfirmId")) {
			action = new GoConfirmIdAction();

		} else if (command.equals("addUser")) {
			action = new AddUserAction();

		}  else if (command.equals("loginCheck")) {
	         action = new LoginAction();

	    } else if (command.equals("logout")) {
	         action = new LogoutAction();

	    } else if (command.equals("checkZero")) {
	         action = new CheckZeroSpareAction();

	    } else if (command.equals("payCertificate")) {
	         action = new PayCertificateAction();

	    } else if (command.equals("payTicketComplete")) {
	         action = new PayCompleteAction();

	    } else if (command.equals("payFeeComplete")) {
	    	action = new PayFeeCompleteAction();

	    } else if (command.equals("billingDiscount")) {
	    	action = new BillingDiscountAction();

	    } else if (command.equals("checkTicket")) {
	    	action = new CheckTicketAction();

	    } else if (command.equals("usageDetails")) {
	    	action = new UsageDetailsAction();

	    }

		return action;
	}
}
