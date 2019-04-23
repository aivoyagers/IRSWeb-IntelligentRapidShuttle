package com.irsspace.irs;

public interface irsPickupDropoffPoint {

    /**
     * @return never null
     */
    irsLocation getLocation();

    /**
     * @return sometimes null
     */
    irsVehicle getVehicle();

    /**
     * @return sometimes null
     */
    irsStudent getNextStudent();
    void setNextStudent(irsStudent irsStudent);

}













