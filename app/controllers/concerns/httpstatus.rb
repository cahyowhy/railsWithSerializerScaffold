module Httpstatus
	def httpstatus 
		@httpStatus = {
			getSuccess: 200,
			postSuccess: 201,
			updateSuccess: 202,
			deleteSuccess: 203,
			getFailed: 400,
			postFailed: 401,
			updateFailed: 402,
			deleteFailed: 403
		}
		return @httpStatus
	end
end