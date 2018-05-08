package dto;

import lombok.Data;

@Data   //Data 어노테이션 사용 시 클래스내 모든필드에 Getter,Setter 자동생성
public class ReservationVO {

   private String   floor;
   private String   userCarnum;
   private String   i_car_t;
   private String   o_car_t;
   private int	money;
   private String	inOrOut;
   private String   discountInfo;

}