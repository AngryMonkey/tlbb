--����NPC
--������
--��ͨ

x000120_g_shoptableindex=102

--**********************************
--�¼��������
--**********************************
function x000120_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x000120_g_shoptableindex )
end

--**********************************
--ʱ�Ӻ���
--**********************************
function x000120_OnCharacterTimer( sceneId, selfId, dataId, uTime )
	local curX, curZ = GetWorldPos(sceneId, selfId)
	if curX<=173 and curX>=171 and curZ <=142 and curZ>=140 then
		SetPos( sceneId, selfId, 235,140) 
	elseif curX<=236 and curX>=234 and curZ<=141 and curZ>=139 then
		SetPos( sceneId, selfId, 116,177)
	elseif curX<=117 and curX>=115 and curZ<=178 and curZ>=176 then
		SetPos( sceneId, selfId, 172,141)
	else
		SetPos( sceneId, selfId, 172,141)
	end
end
