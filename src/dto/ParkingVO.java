package dto;

import lombok.Data;

@Data   //Data 어노테이션 사용 시 클래스내 모든필드에 Getter,Setter 자동생성
public class ParkingVO {


   private String floor;
   private int spare;
}