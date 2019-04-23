package com.irsspace.irs;

public class irsStudent implements java.io.Serializable, irsPickupDropoffPoint {

	static final long serialVersionUID = 1L;

	private java.lang.String name;

	// Shadow variables
	private com.irsspace.irs.irsStudent nextStudent;

	private com.irsspace.irs.irsLocation location;

	private com.irsspace.irs.irsVehicle vehicle;

	private com.irsspace.irs.irsPickupDropoffPoint prevPickupDropoffPoint;

	public irsStudent() {
	}

	public java.lang.String getName() {
		return this.name;
	}

	public void setName(java.lang.String name) {
		this.name = name;
	}

	@Override
	public com.irsspace.irs.irsStudent getNextStudent() {
		return this.nextStudent;
	}

	@Override
	public void setNextStudent(com.irsspace.irs.irsStudent nextStudent) {
		this.nextStudent = nextStudent;
	}

	@Override
	public com.irsspace.irs.irsLocation getLocation() {
		return this.location;
	}

	public void setLocation(com.irsspace.irs.irsLocation location) {
		this.location = location;
	}

	@Override
	public com.irsspace.irs.irsVehicle getVehicle() {
		return this.vehicle;
	}

	public void setVehicle(com.irsspace.irs.irsVehicle vehicle) {
		this.vehicle = vehicle;
	}

	public com.irsspace.irs.irsPickupDropoffPoint getPrevPickupDropoffPoint() {
		return this.prevPickupDropoffPoint;
	}

	public void setPrevPickupDropoffPoint(
			com.irsspace.irs.irsPickupDropoffPoint prevPickupDropoffPoint) {
		this.prevPickupDropoffPoint = prevPickupDropoffPoint;
	}

	public irsStudent(java.lang.String name,
			com.irsspace.irs.irsStudent nextStudent,
			com.irsspace.irs.irsLocation location,
			com.irsspace.irs.irsVehicle vehicle,
			com.irsspace.irs.irsPickupDropoffPoint prevPickupDropoffPoint) {
		this.name = name;
		this.nextStudent = nextStudent;
		this.location = location;
		this.vehicle = vehicle;
		this.prevPickupDropoffPoint = prevPickupDropoffPoint;
	}

	public static class DifficultyComparator
			implements
				java.io.Serializable,
				java.util.Comparator<com.irsspace.irs.irsStudent> {
		static final long serialVersionUID = 1L;

		@javax.annotation.Generated(value = {"org.optaplanner.workbench.screens.domaineditor.service.ComparatorDefinitionService"})
		public int compare(com.irsspace.irs.irsStudent o1,
				com.irsspace.irs.irsStudent o2) {
			return 0;
		}
	}

}