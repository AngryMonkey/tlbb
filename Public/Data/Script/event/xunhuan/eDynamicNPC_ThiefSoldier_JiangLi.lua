
--************************************************************************
--MisDescBegin
--�ű���
x050015_g_ScriptId	= 050015

--MisDescEnd
--************************************************************************


x050015_ScoreMin = 100

x050015_TitleLevel1 = 131
x050015_TitleLevel2 = 132
x050015_TitleLevel3 = 133
x050015_TitleLevel4 = 134
x050015_TitleLevel5 = 135

--�̽�����ID	--add by xindefeng
x050015_g_TangJinMingTieID = 30505205
--һ��ɾ���̽���������	--add by xindefeng
x050015_g_DelMingTieCount = 1

--**********************************
--������ں���
--**********************************
function x050015_OnDefaultEvent( sceneId, selfId, targetId )
	local SelNum = GetNumText()		
	if SelNum == 1 then	
		x050015_DuiHuan( sceneId, selfId, targetId )
	elseif SelNum == 2 then
		x050015_ChaXun( sceneId, selfId, targetId )
	elseif SelNum == 3 then	--�һ�����Զ���ƺ�--add by xindefeng
		x050015_ZiDingYi(sceneId, selfId, targetId)
	elseif SelNum == 22 then	--������ȡ����Զ���ƺ�--add by xindefeng
		x050015_MsgBox(sceneId, selfId, targetId, "#{TangJinMingTie_Help}")
	elseif SelNum == 255 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

--**********************************
--�о��¼�
--**********************************
function x050015_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x050015_g_ScriptId,"��Ҫ�һ��ҵĳƺ�",6,1)
	AddNumText(sceneId,x050015_g_ScriptId,"�����ѯ�ҵĻ���",6,2)	
	AddNumText(sceneId,x050015_g_ScriptId,"��ȡ����Զ��ƺ�",6,3)--add by  xindefeng
	AddNumText(sceneId,x050015_g_ScriptId,"������ȡ����Զ��ƺ�", 11, 22 )--add by xindefeng
  AddNumText(sceneId,x050015_g_ScriptId,"�뿪......",8, 255 )
end

function x050015_GetCurTitle( sceneId, selfId )    --���ݻ���ȡ�óƺ�(�ƺű��)
    local Score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )
    
    
    local Title = 0
    
    if Score >= 100 and Score < 500 then
        Title = x050015_TitleLevel1
        
    end
    
    if Score >= 500 and Score < 5000 then
        Title = x050015_TitleLevel2
    end
    
    if Score >= 5000 and Score < 30000 then
        Title = x050015_TitleLevel3
    end
    
    if Score >= 30000 and Score < 65000 then
        Title =  x050015_TitleLevel4
    end
    
    if Score >= 65000 then
        Title =  x050015_TitleLevel5
    end
  
    return Title
     
end

function x050015_GetTitleName( Title )    --���ݳƺű��ȡ�óƺ�����

    local TitleName = ""

    if Title == x050015_TitleLevel1 then
        TitleName = "ƽ��ʿ��"
    elseif Title == x050015_TitleLevel2 then
        TitleName = "ƽ���ӳ�"
    elseif Title == x050015_TitleLevel3 then
        TitleName = "ƽ��ͳ��"
    elseif Title == x050015_TitleLevel4 then
        TitleName = "���ܽ���"
    elseif Title == x050015_TitleLevel5 then
        TitleName = "����Ԫ˧"
    elseif Title > x050015_TitleLevel5 then
        TitleName = "����Ԫ˧"
    else
        TitleName = "ƽ��ʿ��"
    end

    return TitleName
end


--**********************************
--��Ҫ�һ��ҵĳƺ�
--**********************************
function x050015_DuiHuan( sceneId, selfId, targetId )
	local score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )	--��ȡ�ﹱ����
  if score < 100 then
   x050015_MsgBox( sceneId, selfId, targetId,"  ���µĹ��׻������Ի���µĳƺţ������Ŭ����" )
   return
  end  
  
  local OldTitle = GetTitle(sceneId, selfId, 6)
  local CurTitle = x050015_GetCurTitle( sceneId, selfId )
  
  local strText = ""
  if OldTitle == x050015_TitleLevel5 then
      strText = format( "  ���Ѿ��������ߵȼ��ĳƺš�" )
  elseif( CurTitle > OldTitle  ) then
      AwardTitle( sceneId, selfId,  6, CurTitle )  --��ԭ���ĳƺ��滻
      DispatchAllTitle( sceneId, selfId )          --ˢ�¿ͻ��˳ƺ�
      local TitleName = x050015_GetTitleName( CurTitle )
      strText = format( "  ������,��͢����־ʿ��ƽ��������Ϊ��ο����ί��������ƺ� %s��ϣ�������ܹ�����Ϊƽ�������Լ���������",  TitleName )      
  else
      strText = format( "  ���µĹ��׻������Ի���µĳƺţ������Ŭ����" )
  end
  
  x050015_MsgBox( sceneId, selfId, targetId, strText )	

end
--**********************************
--�����ѯ�ҵĻ���
--**********************************
function x050015_ChaXun( sceneId, selfId, targetId )
	score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )
	local strText = format( " ����Ŀǰ�Ļ���Ϊ%d�������Ŭ����", score )
	x050015_MsgBox( sceneId, selfId, targetId, strText )
end

--**************************************************
--�һ��ҵ��Զ�����ƺ�	--add by xindefeng
--**************************************************
function x050015_ZiDingYi( sceneId, selfId, targetId )
  --�������Ƿ�������
  local guildid	= GetHumanGuildID(sceneId, selfId)  
  if(guildid == -1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    �һ�ʧ�ܣ��㻹û�м����κΰ��ɡ�#W")
  	return
  end
	
	--�������Ƿ���"�̽�����"
  local count = GetItemCount(sceneId, selfId, x050015_g_TangJinMingTieID)
  if(count < 1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    �һ�ʧ�ܣ���Ҫ#Y�̽�������#W")
  	return
  end
  count = LuaFnGetAvailableItemCount(sceneId, selfId, x050015_g_TangJinMingTieID)
  if(count < 1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    �һ�ʧ�ܣ��������#Y�̽�����#W�ǲ��������ˡ�")
  	return
  end
  
  --֪ͨServer������ȡ�ƺ���
  LuaFnDrawGuildPositionName(sceneId, selfId, targetId)
end

--**************************************************
--��Serverֱ�ӵ���	--add by xindefeng
--**************************************************
function x050015_OnDrawPositonName_Succ( sceneId, selfId )  
  --ɾ��"�̽�����"
  local ret = LuaFnDelAvailableItem(sceneId, selfId, x050015_g_TangJinMingTieID, x050015_g_DelMingTieCount)
	if ret < 1  then
		x050015_MsgBox(sceneId, selfId, -1, "    �һ�ʧ�ܣ��������#Y�̽�����#W�ǲ��������ˡ�")
		return 0
	end
	
	return 1
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x050015_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		x050015_DuiHuan( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		x050015_ChaXun( sceneId, selfId, targetId )
	elseif GetNumText() == 3 then	--�һ�����Զ���ƺ�--add by xindefeng
		x050015_ZiDingYi(sceneId, selfId, targetId)
	elseif GetNumText() == 22 then	--������ȡ����Զ���ƺ�--add by xindefeng
		x050015_MsgBox(sceneId, selfId, targetId, "#{TangJinMingTie_Help}")	
	elseif GetNumText() == 255 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end	
end

--**********************************
--����������
--**********************************
function x050015_CheckAccept( sceneId, selfId )

	return
end

--**********************************
--����
--**********************************
function x050015_OnAccept( sceneId, selfId )


end

--**********************************
--����
--**********************************
function x050015_OnAbandon( sceneId, selfId )


end

--**********************************
--��������
--**********************************
function x050015_MakeCopyScene( sceneId, selfId, nearmembercount )


end

--**********************************
--����
--**********************************
function x050015_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x050015_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--�ύ
--**********************************
function x050015_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x050015_OnKillObject( sceneId, selfId, objdataId, objId )


end

--**********************************
--���������¼�
--**********************************
function x050015_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x050015_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x050015_OnCopySceneReady( sceneId, destsceneId )


end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x050015_OnPlayerEnter( sceneId, selfId )

end

--**********************************
--������ڸ����������¼�
--**********************************
function x050015_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x050015_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x050015_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x050015_OnCopySceneTimer( sceneId, nowTime )

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x050015_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x050015_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
		AddNumText(sceneId,x050015_g_ScriptId,"�뿪......",8, 255 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end
