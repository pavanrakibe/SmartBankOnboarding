package com.smartbank.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor


@Builder


@Entity
@Table(name="contact_leads")
public class Contact_Entity {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	@Column(name="name", nullable = false)
	private String name;
	
	
	@Column(name="email", nullable = false, unique=true)
	private String email;
	
	
	@Column(name="mobile", nullable=false)
	private String mobile;
	
	
	@Column(name="subject", nullable = false)
	private String subject;
	
	
	@Column(name="message", nullable=false)
	private String message;
	
	
	@Column(name="created_date", nullable=false)
	private LocalDateTime createdDate;
	
	
	
	@PrePersist
	public void prePersist()
	{
		this.createdDate=LocalDateTime.now();
	}

}
