package controller;

import controller.action.Action;
import controller.action.IndexAction;
import controller.action.board.BoardCheckPassAction;
import controller.action.board.BoardCheckPassFormAction;
import controller.action.board.BoardDeleteAction;
import controller.action.board.BoardListAction;
import controller.action.board.BoardUpdateAction;
import controller.action.board.BoardUpdateFormAction;
import controller.action.board.BoardViewAction;
import controller.action.board.BoardWriteAction;
import controller.action.board.BoardWriteFormAction;
import controller.action.commterTicket.BuyTicketFormAction;
import controller.action.commterTicket.PayCertificateAction;
import controller.action.commterTicket.PayCompleteAction;
import controller.action.commterTicket.BuyConfirmAction;
import controller.action.contact.ContactAction;
import controller.action.contact.ContactFomAction;
import controller.action.reservation.CheckZeroSpareAction;
import controller.action.reservation.ReservationConfirmAction;
import controller.action.reservation.ReservationFormAction;
import controller.action.reservation.ReserveConfirmAction;
import controller.action.reservation.ReserveInsertAction;
import controller.action.status.BillingAction;
import controller.action.status.BillingDiscountAction;
import controller.action.status.BillingCheckTicketAction;
import controller.action.status.BillingPayCompleteAction;
import controller.action.status.StatusAction;
import controller.action.status.CountTimeAction;
import controller.action.user.SignUpAction;
import controller.action.user.ConfirmIdAction;
import controller.action.user.FindIDAction;
import controller.action.user.FindPassWordAction;
import controller.action.user.ConfirmIdFormAction;
import controller.action.user.FindIDFormAction;
import controller.action.user.FindPassWordFormAction;
import controller.action.user.LoginAction;
import controller.action.user.LogoutAction;
import controller.action.user.LogInFormAction;
import controller.action.user.SignUpFormAction;
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
			action = new CountTimeAction();

		} else if (command.equals("billing")) {
			action = new BillingAction();

		} else if (command.equals("buyTicket")) {
			action = new BuyTicketFormAction();

		} else if (command.equals("purchaseConfirm")) {
			action = new BuyConfirmAction();

		} else if (command.equals("contact")) {
			action = new ContactAction();

		} else if (command.equals("goContact")) {
			action = new ContactFomAction();

		} else if (command.equals("reservation")) {
			action = new ReservationFormAction();

		} else if (command.equals("reserveConfirm")) {
			action = new ReserveConfirmAction();

		} else if (command.equals("reserveInsert")) {
			action = new ReserveInsertAction();

		} else if (command.equals("lotsCountDelete")) {
			action = new ReservationConfirmAction();

		} else if (command.equals("signUp")) {
			action = new SignUpFormAction();

		} else if (command.equals("signIn")) {
			action = new LogInFormAction();

		} else if (command.equals("confirmId")) {
			action = new ConfirmIdAction();

		} else if (command.equals("goConfirmId")) {
			action = new ConfirmIdFormAction();

		} else if (command.equals("addUser")) {
			action = new SignUpAction();

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
	    	action = new BillingPayCompleteAction();

	    } else if (command.equals("billingDiscount")) {
	    	action = new BillingDiscountAction();

	    } else if (command.equals("checkTicket")) {
	    	action = new BillingCheckTicketAction();

	    } else if (command.equals("usageDetails")) {
	    	action = new UsageDetailsAction();

	    } else if (command.equals("goFindID")) {
	    	action = new FindIDFormAction();

	    } else if (command.equals("goFindPW")) {
	    	action = new FindPassWordFormAction();

	    } else if (command.equals("findPW")) {
	    	action = new FindPassWordAction();

	    } else if (command.equals("findID")) {
	    	action = new FindIDAction();

	    } else if(command.equals("board_list")) {
	         action = new BoardListAction();

		} else if (command.equals("board_write_form")) {
			action = new BoardWriteFormAction();

		} else if (command.equals("board_write")) {
			action = new BoardWriteAction();

		} else if (command.equals("board_view")) {
			action = new BoardViewAction();

		} else if (command.equals("board_check_pass_form")) {
			action = new BoardCheckPassFormAction();

		} else if (command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();

		} else if (command.equals("board_delete")) {
			action = new BoardDeleteAction();

		} else if (command.equals("board_check_pass_action")) {
			action = new BoardCheckPassAction();

		} else if (command.equals("board_update")) {
			action = new BoardUpdateAction();

		}
		return action;
	}
}
