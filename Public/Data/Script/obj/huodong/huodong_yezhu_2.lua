-- 402103
-- Ұ���߻

x402103_g_NpcPos = {x=137,y=107}
x402103_g_NpcId = 163

--**********************************
--�¼�������� 19-145-40 18-149-48
--**********************************
function x402103_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )
	StartOneActivity(sceneId, actId, 1)

	local MonsterId = LuaFnCreateMonster( sceneId, x402103_g_NpcId,
											x402103_g_NpcPos.x, x402103_g_NpcPos.y, 3, -1, 402104 )
	SetCharacterName(sceneId, MonsterId, "��ƮƮ")
	SetCharacterTitle(sceneId, MonsterId, "���񷻷���")
	SetCharacterDieTime(sceneId, MonsterId, 2*1000*60*60)
end

--**********************************
--��������
--**********************************
function x402103_OnTimer( sceneId, actId, uTime )
	
end
