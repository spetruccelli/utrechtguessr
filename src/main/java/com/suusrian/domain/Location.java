package com.suusrian.domain;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Location {

    @XmlAttribute
    private int id;

    @XmlAttribute
    private String latitude;

    @XmlAttribute
    private String longitude;

    @XmlAttribute
    private String image;

    public Location() {
    }

    public Location(int id, String latitude, String longitude, String image) {

        this.id = id;
        this.latitude = latitude;
        this.longitude = longitude;
        this.image = image;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getImage() { return image;}

    public void setImage(String image) { this.image = image;   }
}