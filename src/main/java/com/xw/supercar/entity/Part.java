package com.xw.supercar.entity;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * 配件实体类
 * @author wsz 2017-06-20
 */
@Getter
@Setter
public class Part extends BaseEntity {
	/** 配件编号 */
	private String code;

	/** 配件名称 */
	private String name;

	/** 单位 */
	private String unit;

	/** 销售价 */
	private Double sale;

	/** 批发价 */
	private Double wholeSale;

	/** 产地 */
	private String produceArea;

	/** 规格 */
	private String specification;

	/** 适用车型 */
	private String carModel;

	/** 分类 */
	private String pCategory;

	/** 创建日期 */
	private Date createTime;

	/** 更新日期 */
	private Date updateTime;

	/** 软删除标志 */
	private Byte isDeleted;

	/** 禁用标志 */
	private Byte isDisable;

	/** 预留拓展字段 */
	private String extend1;

	/** 预留拓展字段 */
	private String extend2;

	/** 预留拓展字段 */
	private String extend3;

	public static enum DP {
		id, code, name, unit, sale, wholeSale, produceArea, specification, carModel, pCategory, createTime, updateTime, isDisable, isDeleted;
	}

}