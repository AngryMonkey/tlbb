--���ض�����ű�

--�ű����
x502000_g_ScriptId	= 502000


x502000_GrowPoint =
{
 [1] = { x = 76, z = 55 },
 [2] = { x = 89, z = 42 },
 [3] = { x = 100, z = 34 },
}

function x502000_OnDefaultEvent( sceneId, selfId, targetId )

end

function x502000_OnRespawn( sceneId, selfId, targetId )

	--��ԭBOSS
	if sceneId == 20 then	
		message = format("#{CaoYuan_Boss_00}" );		
		--ȫ�򹫸�
		AddGlobalCountNews( sceneId, message )	
	end
	
end

function x502000_OnDie( sceneId, objId, killerId )

	local nObjType = GetCharacterType(sceneId, killerId);
	local nHumanId = killerId
	if nObjType then		
		if nObjType == 1 then
			nHumanId = killerId;
		elseif nObjType == 3 then
			nHumanId = GetPetCreator(sceneId, killerId);
		end
	end

	local	namHuman	= LuaFnGetName( sceneId, nHumanId )
	local	namMonster= LuaFnGetName( sceneId, objId )
	local	namScene	= GetSceneName( sceneId )

	if namMonster == "��������" then
		namMonster = "#{_BOSS22}"
	elseif namMonster == "ľͰ��" then
		namMonster = "#{_BOSS23}"
	elseif namMonster == "��" then
		namMonster = "#{_BOSS30}"
	elseif namMonster == "��ħ" then
		namMonster = "#{_BOSS31}"
	elseif namMonster == "��˿֩����" then
		namMonster = "#{_BOSS32}"
	elseif namMonster == "��˿֩����" then
		namMonster = "#{_BOSS33}"
	elseif namMonster == "����ħ" then
		namMonster = "#{_BOSS35}"
	elseif namMonster == "�׵۵���Ӱ" then
		namMonster = "#{_BOSS36}"
	elseif namMonster == "�׵�" then
		namMonster = "#{_BOSS37}"
	elseif namMonster == "ڤ��" then
		namMonster = "#{_BOSS38}"
	elseif namMonster == "Ѫ����" then
		namMonster = "#{_BOSS39}"
	elseif namMonster == "����" then
		namMonster = "#{_BOSS40}"
	elseif namMonster == "�������" then
		namMonster = "#{_BOSS41}"
	elseif namMonster == "����ʮ��" then
		namMonster = "#{_BOSS34}"
	end


	--ҩ�� �������
	if sceneId == 5 then
	
		local sceneId = 5;
		local x,y;
	
		local randPosIndex = random(3);
		x = x502000_GrowPoint[ randPosIndex ].x;
		y = x502000_GrowPoint[ randPosIndex ].z;
		
--		local itemBoxId = LuaFnItemBoxEnterSceneEx(sceneId, x, y, 776, 30*1000);
--		AddItemToBox(sceneId, itemBoxId, QUALITY_MUST_BE_CHANGE, 1, 40004414);
		local growPointType = 775;
		local ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, 40004414 )	
		SetItemBoxMaxGrowTime(sceneId,ItemBoxId,30*60*1000)	--�趨����ʱ��
		
		local message = format("�������ţ���������ҩ�Ľ�����ʿ���࣬�������ƴ󻹵���ҩ�����ѣ�ҩ���ֻص���������ĵط������λ��ϸѰ�ҡ�" );	
		AddGlobalCountNews( sceneId, message )
		
		--ͳ����Ϣ
		LuaFnAuditHDXianCaoZhengDuo(sceneId, killerId, "ҩ������");

		local actId = 36;
		
		local idGUIDSaved = GetActivityParam( sceneId, actId, 3 );
		local idObjSaved  = LuaFnGuid2ObjId( sceneId, idGUIDSaved );
		if LuaFnIsObjValid( sceneId, idObjSaved ) == 1 then
			
			local nYaoDingCount = GetItemCount(sceneId, idObjSaved, 40004415);
			if nYaoDingCount >= 1 then	
				DelItem(sceneId, idObjSaved, 40004415, nYaoDingCount);
			end
					
		end
		
		SetActivityParam( sceneId, actId, 2, 0 );
		SetActivityParam( sceneId, actId, 3, 0 );
		SetActivityParam( sceneId, actId, 4, 0 );
		SetActivityParam( sceneId, actId, 5, 0 );
		SetActivityParam( sceneId, actId, 6, 0 );
		SetActivityParam( sceneId, actId, 7, 0 );
		SetActivityParam( sceneId, actId, 8, 0 );
	end

	--��ԭBOSS
	if sceneId == 20 then
	
		local randMessage = random(3);

		if randMessage == 1 then
	   		message = format("#{CaoYuan_Boss_01}#W#{_INFOUSR%s}#P#{CaoYuan_Boss_02}", namHuman );
		elseif randMessage == 2 then		
			message = format("#{_INFOUSR%s}#P#{CaoYuan_Boss_03}", namHuman );
		else		
			message = format("#{_INFOUSR%s}#P#{CaoYuan_Boss_04}", namHuman );
		end
		
		--ȫ�򹫸�
		AddGlobalCountNews( sceneId, message )

	
	end
	
	local message;	
	---���ض�1-4��
	if sceneId == 123 or sceneId == 126 or sceneId == 148 or sceneId == 149 then
	
		local randMessage = random(3);

		if randMessage == 1 then
	   		message = format("#G%s#P��#Y%s#P#{BroadMsg_YanWangGuMu_00}#W#{_INFOUSR%s}#P#{BroadMsg_YanWangGuMu_01}#Y%s#P#{BroadMsg_YanWangGuMu_02}", namScene, namMonster, namHuman, namMonster );
		elseif randMessage == 2 then		
			message = format("#Y%s#P#{BroadMsg_YanWangGuMu_03}#G%s#P#{BroadMsg_YanWangGuMu_04}#W#{_INFOUSR%s}#P#{BroadMsg_YanWangGuMu_05}", namMonster, namScene, namHuman );
		else		
			message = format("#G%s#P#{BroadMsg_06}#W#{_INFOUSR%s}#P#{BroadMsg_07}#Y%s#P#{BroadMsg_08}#Y%s#P#{BroadMsg_09}#W#{_INFOUSR%s}#P#{BroadMsg_10}",namScene, namHuman, namMonster, namMonster, namHuman );
		end
		--PrintStr(message)
		--ȫ�򹫸�
		AddGlobalCountNews( sceneId, message )
	
	end
	---���ض����	
	if sceneId == 150 then
		
		local randMessage = random(3);

		if randMessage == 1 then
	   		message = format("#{BaoZang_MuBoTong_0}#W#{_INFOUSR%s}#P#{BaoZang_MuBoTong_1}", namHuman);
		elseif randMessage == 2 then		
			message = format("#{_INFOUSR%s}#P#{BaoZang_MuBoTong_2}", namHuman );
		else
			message = format("#{BaoZang_MuBoTong_3}#W#{_INFOUSR%s}#P#{BaoZang_MuBoTong_4}#{_INFOUSR%s}#{BaoZang_MuBoTong_5}", namHuman, namHuman );
		end
		--PrintStr(message)
		--ȫ�򹫸�
		AddGlobalCountNews( sceneId, message )

	end
	
	---������Ĺ
	if sceneId >= 159 and sceneId <= 167 then
	
		local randMessage = random(3);
				
		if randMessage == 1 then
	   		message = format("#{_INFOUSR%s}#P��#Y%s#P��#G%s#P#{BroadMsg_15}#Y%s#P#{BroadMsg_16}", namHuman, namMonster, namScene, namMonster);
		elseif randMessage == 2 then		
			message = format("#{_INFOUSR%s}#P��#G%s#P#{BroadMsg_11}#Y%s��", namHuman, namScene, namMonster);
		else
			message = format("%s#P#{BroadMsg_12}#G%s#P#{BroadMsg_13}#W#{_INFOUSR%s}#P#{BroadMsg_14}", namMonster, namScene, namHuman);
		end
		
		--ȫ�򹫸�
		AddGlobalCountNews( sceneId, message )
	
	end
	

end
