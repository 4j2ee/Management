package edu.xcc.module;

public class Income {
	private String Id,Barcode, ProDate,HouseId,Number,DateTime,OperatorId,Name,Other;

	public String getProDate() {
		return ProDate;
	}

	public void setProDate(String proDate) {
		ProDate = proDate;
	}

	public String getDateTime() {
		return DateTime;
	}

	public void setDateTime(String dateTime) {
		DateTime = dateTime;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getBarcode() {
		return Barcode;
	}

	public void setBarcode(String barcode) {
		Barcode = barcode;
	}

	public String getHouseId() {
		return HouseId;
	}

	public void setHouseId(String houseId) {
		HouseId = houseId;
	}

	public String getNumber() {
		return Number;
	}

	public void setNumber(String number) {
		Number = number;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getOperatorId() {
		return OperatorId;
	}

	public void setOperatorId(String operatorId) {
		OperatorId = operatorId;
	}

	public String getOther() {
		return Other;
	}

	public void setOther(String other) {
		Other = other;
	}
}
