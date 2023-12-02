local function OnInventorySlotUpdate(_, bagId, slotIndex, _, _, _, stackCountChange)
	if IsItemFromCrownCrate(bagId, slotIndex) then
		local itemsRequired, gemsAwarded = GetNumCrownGemsFromItemManualGemification(bagId, slotIndex)

		if itemsRequired > 0 and gemsAwarded > 0 then
			local itemId = GetItemId(bagId, slotIndex)
			GemifyItem(itemId, stackCountChange)
		end
	 end
end

EVENT_MANAGER:RegisterForEvent("AutoGemify", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, OnInventorySlotUpdate)
EVENT_MANAGER:AddFilterForEvent("AutoGemify", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_IS_NEW_ITEM, true)
EVENT_MANAGER:AddFilterForEvent("AutoGemify", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, REGISTER_FILTER_INVENTORY_UPDATE_REASON, INVENTORY_UPDATE_REASON_DEFAULT)