--��翷帱��....
--��ľԪ�Ի��ű�....

--�ű���
x402274_g_ScriptId	= 402274

--�����߼��ű���....
x402274_g_FuBenScriptId = 402263

--**********************************
--����....
--**********************************
function x402274_OnDie( sceneId, selfId, killerId )

	--�����û����ս������ˮ�������ս����ˮ....
	if 2 ~= CallScriptFunction( x402274_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" )	then
		CallScriptFunction( x402274_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "LiQiuShui", 1 )
	end
	-- zchw ȫ�򹫸�
	local	playerName	= GetName( sceneId, killerId )
	
	--ɱ��������ǳ������ȡ�����˵�����....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--��������������ȡ�ӳ�������....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("#{PMF_8812_04}#{_INFOUSR%s}#{PMF_8812_05}", playerName); --��ƽ��
		AddGlobalCountNews( sceneId, str )
	end
end
