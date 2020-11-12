package org.final_proj.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IngredientDTO {

	private String userId;
	private List<String> goodsNo;
	private List<Long> amount;
}
