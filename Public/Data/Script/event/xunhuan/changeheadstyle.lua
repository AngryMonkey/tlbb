--[ ������ QUFEI 2007-12-15 16:40 UPDATE BugID 26242 ]
--����ͷ��
--�ű���
x805030_g_ScriptId = 805030

--����ͷ��UI 112730

--**********************************
--�о��¼�
--**********************************
function x805030_OnEnumerate( sceneId, selfId, targetId )
	-- ������Ϣ
	--BeginEvent(sceneId)
	--	AddText(sceneId, "�������ͷ��ű�");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	
	
	-- ΪʲôҪ NPC ���֣�
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 112730)
	return
end

--**********************************
--����ͷ��
--**********************************
function x805030_FinishAdjust( sceneId, selfId, styleId )
	
	-- ͷ��δѡ�л�ѡ����Ч
	if styleId <= 0 then														
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_004}" )
		return		
	end
	
	-- �õ�����ͷ��������Ʒ��id��������
	local ItemId, ItemCount = GetChangeHeadInfo(styleId)
		
	-- ����ֵ�Ƿ�
	if ItemId < 0 or ItemCount < 0 then
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	--������Ʒ�Ƿ��û�����
	if ItemCount > nItemNum then
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_005}" )
		return
	end

	-- ��Ʒ���ͨ�����ټ����ҽ�Ǯ
	local moneyJZ = GetMoneyJZ (sceneId, selfId);
	local money = GetMoney (sceneId, selfId);
	
	-- ��Ʒ�ͽ�Ǯ��ⶼͨ��
	if (moneyJZ + money >= 50000)	then
		-- ���������ͷ�񣨻������������������Ʒ�ͽ�Ǯ��
		local ret = ChangePlayerHeadImage( sceneId, selfId, styleId )	
		if ret == 0  then																--�ɹ�
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_010}" )		
					
		-- ����Ϊ����ʧ��ʱ�Ĳ��ִ�����Ϣ
		elseif ret == 1 then														--��ѡ��ͷ������ҵ�ǰ��ͷ��һ��
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_009}" )				
			return
		elseif ret == 3 then														--û����Ҫ���ĵ���Ʒ�����Ʒ������
			x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_005}" )				
			return
		else
			return
		end
	
	-- ��Ǯ����	
	else
		x805030_NotifyTip( sceneId, selfId, "#{INTERHEAD_XML_006}" )						
		return
	end
	
	-- ��������
	local message;
	if random(2) == 1 then
		message = format("#W#{_INFOUSR%s}#{INTERHEAD_XML_007}", LuaFnGetName(sceneId, selfId));
	else
		message = format("#W#{INTERHEAD_XML_011}#{_INFOUSR%s}#{INTERHEAD_XML_012}", LuaFnGetName(sceneId, selfId));
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
	-- ��¼�ɹ��޸�ͷ��������־
	AuditChangeHead( sceneId, selfId, styleId )
		
end

--**********************************
-- ��Ļ�ϵ���Ŀ��ʾ
--**********************************
function x805030_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
