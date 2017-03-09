package com.suusrian.domain;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Score {

    @XmlAttribute
    private int id;

    @XmlAttribute
    private Double distance;

    @XmlAttribute
    private int points;


    public Score() {
    }

    public Score(int id, Double distance, int points) {

        this.id = id;
        this.distance = distance;
        this.points = points;
     }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }


}