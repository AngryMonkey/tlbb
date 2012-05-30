--生长点脚本，幼苗系列

--脚本号
--g_ScriptId = 711000

-- 生长点信息
x711000_g_GPInfo = {}

-- 生长点类型号为索引号

-- NextGeneration: 该生长点回收后长出的新生长点的类型
-- RecycleDuration: 回收时间

x711000_g_GPInfo[	501	] = { NextGeneration =	502	, RecycleDuration =	255000	}
x711000_g_GPInfo[	504	] = { NextGeneration =	505	, RecycleDuration =	255000	}
x711000_g_GPInfo[	507	] = { NextGeneration =	508	, RecycleDuration =	255000	}
x711000_g_GPInfo[	510	] = { NextGeneration =	511	, RecycleDuration =	255000	}
x711000_g_GPInfo[	513	] = { NextGeneration =	514	, RecycleDuration =	255000	}
x711000_g_GPInfo[	516	] = { NextGeneration =	517	, RecycleDuration =	255000	}
x711000_g_GPInfo[	519	] = { NextGeneration =	520	, RecycleDuration =	255000	}
x711000_g_GPInfo[	522	] = { NextGeneration =	523	, RecycleDuration =	255000	}
x711000_g_GPInfo[	525	] = { NextGeneration =	526	, RecycleDuration =	255000	}
x711000_g_GPInfo[	528	] = { NextGeneration =	529	, RecycleDuration =	255000	}
x711000_g_GPInfo[	531	] = { NextGeneration =	532	, RecycleDuration =	255000	}
x711000_g_GPInfo[	534	] = { NextGeneration =	535	, RecycleDuration =	255000	}
x711000_g_GPInfo[	537	] = { NextGeneration =	538	, RecycleDuration =	255000	}
x711000_g_GPInfo[	540	] = { NextGeneration =	541	, RecycleDuration =	255000	}
x711000_g_GPInfo[	543	] = { NextGeneration =	544	, RecycleDuration =	255000	}
x711000_g_GPInfo[	546	] = { NextGeneration =	547	, RecycleDuration =	255000	}
x711000_g_GPInfo[	549	] = { NextGeneration =	550	, RecycleDuration =	255000	}
x711000_g_GPInfo[	552	] = { NextGeneration =	553	, RecycleDuration =	255000	}
x711000_g_GPInfo[	555	] = { NextGeneration =	556	, RecycleDuration =	255000	}
x711000_g_GPInfo[	558	] = { NextGeneration =	559	, RecycleDuration =	255000	}
x711000_g_GPInfo[	561	] = { NextGeneration =	562	, RecycleDuration =	255000	}
x711000_g_GPInfo[	564	] = { NextGeneration =	565	, RecycleDuration =	255000	}
x711000_g_GPInfo[	567	] = { NextGeneration =	568	, RecycleDuration =	255000	}
x711000_g_GPInfo[	570	] = { NextGeneration =	571	, RecycleDuration =	255000	}

x711000_g_GPInfo[	701	] = { NextGeneration =	702	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	704	] = { NextGeneration =	705	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	707	] = { NextGeneration =	708	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	710	] = { NextGeneration =	711	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	713	] = { NextGeneration =	714	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	716	] = { NextGeneration =	717	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	719	] = { NextGeneration =	720	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	722	] = { NextGeneration =	723	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	725	] = { NextGeneration =	726	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	728	] = { NextGeneration =	729	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	731	] = { NextGeneration =	732	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	734	] = { NextGeneration =	735	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	737	] = { NextGeneration =	738	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	740	] = { NextGeneration =	741	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	743	] = { NextGeneration =	744	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	746	] = { NextGeneration =	747	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	749	] = { NextGeneration =	750	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	752	] = { NextGeneration =	753	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	755	] = { NextGeneration =	756	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	758	] = { NextGeneration =	759	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	761	] = { NextGeneration =	762	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	764	] = { NextGeneration =	765	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	767	] = { NextGeneration =	768	, RecycleDuration =	4155000	}
x711000_g_GPInfo[	770	] = { NextGeneration =	771	, RecycleDuration =	4155000	}


function x711000_OnRecycle( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	local GPInfo = x711000_g_GPInfo[growPointType]
	if not GPInfo then
		return 1
	end

	local itemBoxX = GetItemBoxWorldPosX( sceneId, targetId )
	local itemBoxZ = GetItemBoxWorldPosZ( sceneId, targetId )
	local ItemBoxId = ItemBoxEnterScene( itemBoxX, itemBoxZ, GPInfo.NextGeneration, sceneId, QUALITY_MUST_BE_CHANGE,0 )

	--得到生长点的主人GUID
	local ItemBoxOwnerGUID = GetItemBoxOwner( sceneId, targetId )				--参数是SceneID，ItemBoxID
	--给ItemBox设定主人
	SetItemBoxOwner( sceneId, ItemBoxId, ItemBoxOwnerGUID )

	SetItemBoxMaxGrowTime( sceneId, ItemBoxId, GPInfo.RecycleDuration )			--设定回收时间
	return 1
end
