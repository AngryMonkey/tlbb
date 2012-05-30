--�����
--���ڻ-��ȡ����

--�ű���
x050054_g_ScriptId = 050054
--�ʱ��
x050054_g_StartDayTime = 8030   --�����ʱ�� 2008-1-31
x050054_g_EndDayTime = 8044   --�����ʱ�� 2008-2-14

--����ID
x050054_g_BianPaoID = 30505165

--x050054_g_strPlayerLvErr = "��ȥը���ޣ����ģ��㻹�ǲ�Ҫȥ�ˣ����޺ÿ��µģ��㻹����10���أ����������ܴ�����ģ�"
--x050054_g_strNotSpace = "���İ���û���㹻�ռ䣬�������������ȡ��"
--x050054_g_strYiLingQu = "���Ѿ�Ҫ�˺ܶ�������������ȥը���ްɣ���˵�����������ǵ�����ͺ���������"
--x050054_g_strGetBianPao = "����һö���ڣ���һöŶ���㿴�����������ģ�һ���ܹ������޴�ܣ����١���Ҳ�ܰ������ܰɡ�"

x050054_g_strPlayerLvErr = "#{NSBS_20071228_04}"
x050054_g_strNotSpace = "���İ���û���㹻�ռ䣬�������������ȡ��"
x050054_g_strYiLingQu = "#{NSBS_20071228_05}"
x050054_g_strGetBianPao = "#{NSBS_20071228_06}"

--**********************************
--������ں���
--**********************************
function x050054_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050054_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	local NumText = GetNumText()

	if NumText == 101 then
		--����˱���....
		x050054_GiveSelfBianPao( sceneId, selfId, targetId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x050054_OnEnumerate( sceneId, selfId, targetId )

    local isTime = x050054_CheckRightTime()
    if 1 == isTime then
			AddNumText(sceneId, x050054_g_ScriptId, "����һö����", 6, 101 )													
    end

end

--**********************************
--����Ƿ��ѽ���
--**********************************
function x050054_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x050054_g_StartDayTime and curDayTime <= x050054_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--����˱���
--**********************************
function x050054_GiveSelfBianPao( sceneId, selfId, targetId )

	--�����ҵȼ�....
	if x050054_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--�����Ѿ����������....
	local num = GetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_NUMBER )
	--�ϴ���ȡʱ��....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_DAYTIME )
	local CurDayTime = GetDayTime()
	
	if CurDayTime <= lastDayTime then		
		if num >10 then--��ȡ��������10
			BeginEvent(sceneId)
				AddText( sceneId, x050054_g_strYiLingQu )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	else
		num = 50;
	end

	--��ⱳ���Ƿ��еط�....
	if x050054_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	
	if x050054_GivePlayerBianPao( sceneId, selfId, targetId ) ==1 then
		SetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_DAYTIME, CurDayTime )
		SetMissionData( sceneId, selfId, MD_CHUNJIE_BIANPAO_NUMBER, num )
	end
	
end

	
--**********************************
--�����ҵȼ��Ƿ����Ҫ��
--**********************************
function x050054_CheckPlayerLv( sceneId, selfId, targetId )

	if GetLevel( sceneId, selfId ) < 10 then
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strPlayerLvErr )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--�����ұ����ռ��Ƿ��㹻
--**********************************
function x050054_CheckPacketSpace( sceneId, selfId, targetId )

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strNotSpace )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--����ұ���
--**********************************
function x050054_GivePlayerBianPao( sceneId, selfId, targetId )
			
	--������1�Լ���....
	--local BagIndex = TryRecieveItem( sceneId, selfId, x050054_g_BianPaoID, QUALITY_MUST_BE_CHANGE )

	--if BagIndex ~= -1 then
		--LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
	--end
	BeginAddItem(sceneId)
	AddItem( sceneId, x050054_g_BianPaoID , 50 )
	local canAdd1 = EndAddItem(sceneId,selfId)
			
	if canAdd1 == 0  then
		--BeginEvent( sceneId )
			--AddText( sceneId, "������Ʒ��û���㹻�ռ䣬���´���ȡʱ�����㹻��Ʒ���ռ䡣" )
		--EndEvent( sceneId )
		--DispatchMissionTips( sceneId, selfId )
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strNotSpace )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		AddItemListToHuman(sceneId,selfId)
				--local transfer = GetItemTransfer(sceneId,selfId,0)
				
				--local str1 = format( "#{_INFOUSR%s}", GetName(sceneId, selfId))
				--local str2 = format("#W#{_INFOMSG%s}", transfer)
				--local strMsg = str1..x500501_g_strDieNotice0..str2..x500501_g_strDieNotice1				
				--BroadMsgByChatPipe(sceneId, selfId, strMsg, 4)	
		BeginEvent(sceneId)
			AddText( sceneId, x050054_g_strGetBianPao )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 1	
	end

end

--**********************************
--����������
--**********************************
function x050054_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050054_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050054_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050054_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x050054_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x050054_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x050054_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x050054_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x050054_OnItemChanged( sceneId, selfId, itemdataId )
end
