package sax;

import org.xml.sax.* ;
import org.xml.sax.helpers.* ;

public class InterroHandler extends DefaultHandler {	
	
	private Double m2;
	private boolean dansUnePiece ;
	
	
	public void startDocument() {
	}
	
	public void endDocument() {
		System.out.println() ;
	}
	
	public void startElement(String nameSpaceURI, String localName, String rawName, Attributes attributs)  {
		if (localName == "maison") {
			System.out.println("Maison " + attributs.getValue("id") + " :");
			this.m2 = 0.;
			this.dansUnePiece = false;
			return;
		} else if (dansUnePiece == false) {
			for (int i= 0; i < attributs.getLength(); i++) {
				if (attributs.getLocalName(i) == "surface-m2") {
					m2 += Double.parseDouble(attributs.getValue(i));
					dansUnePiece = true;
				}
			}
		}
		
		
	}
	
	public void endElement(	String nameSpaceURI, String localName, String rawName)  {
		if (localName == "maison") {
			System.out.println("superficie totale : " + m2);
		} else if (dansUnePiece == true) {
			dansUnePiece = false;
		}
	}
	
	public static void main(String[] args) {
		try {
			XMLReader saxReader = XMLReaderFactory.createXMLReader();
			saxReader.setContentHandler(new InterroHandler());
			saxReader.parse(args[0]);
		} catch (Exception t) {
			t.printStackTrace();
		}
	}
	
}
