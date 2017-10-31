package edu.xcc.module;

public class Store {
	private String Barcode,HouseId,Number,Name;

	public String getBarcode() {
		return Barcode;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
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
}
