package uMer;

import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;

import static org.junit.Assert.*;

public class VanTest {

    @Test
    public void clonet() {
        UMeR uMeR = new UMeR();
        Van b1 = new Van("65-23-GS", 4, new Point2D.Double(),"Carlos Monteiro") ;
        uMeR.registerVehicleP(b1);

        Van b2 = new Van(b1.clone());
        uMeR.registerVehicleP(b2);

        Assert.assertEquals(b1.getLicencePlate(),b2.getLicencePlate());
    }
}