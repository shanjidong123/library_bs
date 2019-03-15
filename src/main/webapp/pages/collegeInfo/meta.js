var metaCollegeType = {
		meta: {
            'id': {},
        	'name': {},
        	'parent_id': {}
        }
};			


var metaCollegeInfo = {
		meta:{
			id: {
                type: 'string'
        },
        name: {
            type: 'string',
			required:true,
			notipFlag: true,
			hasSuccess: true,
			nullMsg:'学生姓名不能为空!'
        },
        code: {
            type: 'string',
			required:true,
			notipFlag: true,
			hasSuccess: true,
			nullMsg:'学生学号不能为空!'
        },
        pk_collegetype: {
            type: 'string',
        },
        collegetype_name: {
            type: 'string'
        },
        login_status: {
            type: 'string'
        },
        def1: {
            type: 'string'
        },
        def2: {
            type: 'string'
        }
	}
};