--���ֲ���ܷ���ʾ���б��к��ܷ���ֲ�Ľű�

--�ű���
x713551_g_scriptId = 713551

--���ֲ���ܷ���ʾ���б��к��ܷ���ֲ�ĺ���
v_ZhongZhiId = {20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010,
				20104011,20104012,20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,
				20105009,20105010,20105011,20105012}		--����,���������ֲ���Id
v_ZhongZhiNeedLevel = {1,2,3,4,5,6,7,8,9,10,
						11,12,1,2,3,4,5,6,7,8,
						9,10,11,12}				--����,���������ֲ���Ӧ�ĵȼ�
v_ZhongZhiName = {"С��","����","����","����","����","����","֥��","�̶�","�ƶ�","�϶�",
					"������","��ͷ","��","��","��","��","��","˿","��","�",
					"��","��","ɴ","��"}		--����,���������ֲ���Ӧ����
v_ItemBoxTypeId = {501,504,507,510,513,516,519,522,525,528,
					531,534,537,540,543,546,549,552,555,558,
					561,564,567,570}				--��������ItemBox������
function x713551_CheckZhiWuValid(sceneId,selfId,zhiwuId)
	v_AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHONGZHI) 
	for k, findId in v_ZhongZhiId do	--����������ֲ���Id
		if zhiwuId == findId then		--�����������Id==��������Id
			if v_AbilityLevel >= v_ZhongZhiNeedLevel[k] then	--��������ֲ���ܵȼ�>=��ֲ��Ҫ���ܵȼ�]
				return k
			else
			return 0
			end
			return -1  --û������ֲ��
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
