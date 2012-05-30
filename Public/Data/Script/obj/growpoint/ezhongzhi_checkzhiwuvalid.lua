--检测植物能否显示在列表中和能否种植的脚本

--脚本号
x713551_g_scriptId = 713551

--检测植物能否显示在列表中和能否种植的函数
v_ZhongZhiId = {20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010,
				20104011,20104012,20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,
				20105009,20105010,20105011,20105012}		--数组,用来存放种植物的Id
v_ZhongZhiNeedLevel = {1,2,3,4,5,6,7,8,9,10,
						11,12,1,2,3,4,5,6,7,8,
						9,10,11,12}				--数组,用来存放种植物对应的等级
v_ZhongZhiName = {"小麦","大米","玉米","花生","红薯","高粱","芝麻","绿豆","黄豆","蚕豆",
					"马铃薯","芋头","麻","棉","绸","帛","绢","丝","缎","绫",
					"罗","绒","纱","锦"}		--数组,用来存放种植物对应名称
v_ItemBoxTypeId = {501,504,507,510,513,516,519,522,525,528,
					531,534,537,540,543,546,549,552,555,558,
					561,564,567,570}				--用来查找ItemBox的类型
function x713551_CheckZhiWuValid(sceneId,selfId,zhiwuId)
	v_AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHONGZHI) 
	for k, findId in v_ZhongZhiId do	--遍历所有种植物的Id
		if zhiwuId == findId then		--如果传过来的Id==遍历到的Id
			if v_AbilityLevel >= v_ZhongZhiNeedLevel[k] then	--如果玩家种植技能等级>=该植物要求技能等级]
				return k
			else
			return 0
			end
			return -1  --没有这种植物
		end
	end
end


function x713551_FindItemBoxTypeId(sceneId,selfId,zhiwuId)

	for m, findId in v_ZhongZhiId do	
		if zhiwuId == findId then
			return v_ItemBoxTypeId[m]
		end
	end

	return 0
end

function x713551_FindZhiWuLevel(sceneId,selfId,zhiwuId)
	for n, findId in v_ZhongZhiId do	
		if zhiwuId == findId then
			return v_ZhongZhiNeedLevel[n]
		end
	end

	return 0
end
