package com.irsspace.irs;

import java.io.StringReader;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

public class SolverPostObject {
	
	private irsSolution irsSolutionObj;
	
	public SolverPostObject() {
		 irsSolutionObj = new irsSolution();
		//Populate scool Array, student Array, vehicle Array java class
		/*	irsSolution	 irsSolutionObject = new irsSolution();
			irsPickupDropoffPoint irsPickupDropoffParticulars irsStudentObj = new irsSirsPickupDropoffParticulars();
			irsPickupDropoffPoint irsPickupDropoffParticulars irsSchoolObj = new irsPickupDropoffParticulars();
			irsVehicle irsVehicleObj = new irsVehicle();
			
			irsStudent irsStudentObj = new irsStudent();
			irsSolutionObject.getStudentList();*/
	}
	
	
	public void convertXmltoObject(String xmlString ){
		
		
	 
				JAXBContext jaxbContext;
				try
				{
				    jaxbContext = JAXBContext.newInstance(irsSolution.class);             
				 
				    Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
				 
				    irsSolution irsSolutionObj = (irsSolution) jaxbUnmarshaller.unmarshal(new StringReader(xmlString));
				     
				    System.out.println(irsSolutionObj);
				}
				catch (JAXBException e)
				{
				    e.printStackTrace();
				}
		
	}
	
	
	public static void main(String args[]) {
		
		
		
		
	}
	
	
	

}
