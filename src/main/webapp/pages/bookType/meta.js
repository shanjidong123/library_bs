var metaInstit = {
				meta : {
					institcode:{
						type:'string',
						required:true,
						notipFlag: true,
						hasSuccess: true,
						nullMsg:'机构编码不能为空!'
					},
					institname:{
						type:'string',
						required:true,
						notipFlag: true,
						hasSuccess: true,
						nullMsg:'机构名称不能为空!'
					},
					institid: {
						 type: 'string'
					},
					parentid : {
						 type: 'string'
					},
					parentname : {
						 type: 'string'
					},
					shortname : {
						 type: 'string'
					}
				}
			};

			
var metaBookType = {
				meta : {
					code:{
						type:'string',
						required:true,
						notipFlag: true,
						hasSuccess: true,
						nullMsg:'图书类别编码不能为空!'
					},
					name:{
						type:'string',
						required:true,
						notipFlag: true,
						hasSuccess: true,
						nullMsg:'图书类别名称不能为空!'
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
					add_person : {
						 type: 'string'
					},
					book_num : {
						 type: 'string'
					}
				}
			};			
