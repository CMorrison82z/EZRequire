local d = {}
local r = {}

return function (a)
	if type(a[1]) ~= "string" then
		for index, value in ipairs(a) do
			table.insert(d, value)
		end
	else
		if #d < 1 then warn("No registered domains. Did you forget to initialize ?") end

		local callingScript = getfenv(0).script

		local rStuff = {}

		for _, mName in ipairs(a) do
			local cachedMod = r[mName]

			if cachedMod then
				table.insert(rStuff, cachedMod)
			else
				local inScript = false

				for _, module in ipairs(callingScript:GetChildren()) do
					if module.Name == mName then
						local rMod = require(module)
						r[mName] = rMod
						table.insert(rStuff, rMod)

						inScript = true
						break
					end
				end

				if not inScript then
					local foundIt = false

					for _, domainInstance in ipairs(d) do
						for _, module in ipairs(domainInstance:GetChildren()) do
							if module.Name == mName then
								local rMod = require(module)
								r[mName] = rMod
								table.insert(rStuff, rMod)

								foundIt = true
								break
							end
						end

						if foundIt then break end
					end
				end
			end
		end

		return table.unpack(rStuff)
	end
end