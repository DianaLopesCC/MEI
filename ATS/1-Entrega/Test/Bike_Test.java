package uMer;

import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;

import static org.junit.Assert.*;

public class Bike_Test {

    @Test
    public void clonet() {
        UMeR uMeR = new UMeR();
        Bike b1 = new Bike("65-23-GS", 4, new Point2D.Double(),"Carlos Monteiro") ;
        uMeR.registerVehicleP(b1);

        Bike b2 = new Bike(b1.clone());
        uMeR.registerVehicleP(b2);

        Assert.assertEquals(b1.getLicencePlate(),b2.getLicencePlate());
    }

}