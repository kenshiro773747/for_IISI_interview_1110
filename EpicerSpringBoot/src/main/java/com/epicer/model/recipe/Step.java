package com.epicer.model.recipe;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "recipeStep")
@Component
public class Step  implements Serializable{
	@Id
	@Column(name = "stepid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "step")
	private String step;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "recipeid")
	@JsonBackReference
	private Recipe recipeBean;
	@Column(name = "stepimage")
	private  String stepImage;
	
	public Step(String step, Recipe recipeBean) {
		super();
		this.step = step;
		this.recipeBean = recipeBean;
	}
	
	public Step(String step, Recipe recipeBean, String stepImage) {
		super();
		this.step = step;
		this.recipeBean = recipeBean;
		this.stepImage = stepImage;
	}

	public Step(String step) {
		super();
		this.step = step;
	}
	public Step() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public Recipe getRecipeBean() {
		return recipeBean;
	}
	public void setRecipeBean(Recipe recipeBean) {
		this.recipeBean = recipeBean;
	}
	
	
	public String getStepImage() {
		return stepImage;
	}
	public void setStepImage(String stepImage) {
		this.stepImage = stepImage;
	}
	@Override
	public String toString() {
		return "Step [step=" + step + ", recipeBean=" + recipeBean + "]";
	}
}
