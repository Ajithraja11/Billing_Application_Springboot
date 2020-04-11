package com.example.demo.entity;

import javax.validation.constraints.NotNull;

public class Receipt {
	
@NotNull(message="is required")
int receipt;

public int getReceipt() {
	return receipt;
}

public void setReceipt(int receipt) {
	this.receipt = receipt;
}


}
