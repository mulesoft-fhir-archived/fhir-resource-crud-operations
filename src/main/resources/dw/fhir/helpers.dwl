var buildRequestUri = (requestPath: String, queryParams: Object, override: Object = {}) -> do {
	var kvps = queryParams pluck { key: $$, value: override[$$] default $ }
	---
	kvps reduce ((kvp,accum="") ->
	    if (isEmpty(accum)) "$(requestPath)?$(kvp.key)=$(kvp.value)"
	    else "$(accum)&$(kvp.key)=$(kvp.value)"
	)
}