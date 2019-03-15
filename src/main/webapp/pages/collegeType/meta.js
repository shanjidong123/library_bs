var metaCollegeType = {
	meta : {
		code:{
			type:'string',
			required:true,
			notipFlag: true,
			hasSuccess: true,
			nullMsg:'学院类别编码不能为空!'
		},
		name:{
			type:'string',
			required:true,
			notipFlag: true,
			hasSuccess: true,
			nullMsg:'学院类别名称不能为空!'
		},
		id: {
			 type: 'string'
		},
		parent_id : {
			 type: 'string'
		},
		parent_id_name : {
			 type: 'string'
		},
		sort : {
			type:'string',
			required:true,
			notipFlag: true,
			hasSuccess: true,
			nullMsg:'排序不能为空!'
		},
		student_num : {
			 type: 'string'
		},
		def1 : {
			 type: 'string'
		},
		def2 : {
			 type: 'string'
		},
		def3 : {
			 type: 'string'
		}
	}
};			
