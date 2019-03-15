		var metaBookType = {
				meta: {
                    	'id': {},
                    	'name': {},
                    	'parent_id': {}
                	}
			};			

		
		var metaBookInfo = {
				meta:{
					id: {
		                type: 'string'
		            },
		            name: {
		                type: 'string',
						required:true,
						notipFlag: true,
						hasSuccess: true,
						nullMsg:'图书名称不能为空!'
		            },
		            code: {
		                type: 'string',
						required:true,
						notipFlag: true,
						hasSuccess: true,
						nullMsg:'图书编码不能为空!'
		            },
		            publish: {
		                type: 'string'
		            },
		            price_rent:{
		            	 type: 'string'
		            },
		            pk_booktype: {
		                type: 'string',
		            },
		            booktype_name: {
		                type: 'string'
		            }
				}
			};