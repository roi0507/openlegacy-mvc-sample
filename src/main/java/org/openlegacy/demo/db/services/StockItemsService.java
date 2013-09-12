package org.openlegacy.demo.db.services;

import org.openlegacy.demo.db.model.StockItem;
import org.openlegacy.demo.db.model.StockItemImage;
import org.openlegacy.demo.db.model.StockItemNote;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Service
@Transactional
public class StockItemsService {

	@PersistenceContext
	private EntityManager entityManager;

	public StockItem updateStockItem(StockItem stockItem) {
		stockItem = entityManager.merge(stockItem);
		entityManager.flush();
		return stockItem;
	}

	public StockItem getStockItem(Integer itemId) {
		return entityManager.find(StockItem.class, itemId);
	}

	public StockItem getOrCreateStockItem(Integer itemId) {
		StockItem stockItem = entityManager.find(StockItem.class, itemId);
		if (stockItem == null) {
			stockItem = new StockItem();
			stockItem.setItemId(itemId);
			stockItem = updateStockItem(stockItem);
		}
		return stockItem;
	}

	public void addOrUpdateNote(Integer itemId, String noteId, String text) {
		StockItem stockItem = getOrCreateStockItem(itemId);
		StockItemNote stockItemNote = new StockItemNote();
		stockItemNote.setNoteId(noteId);
		stockItemNote.setText(text);
		stockItem.getNotes().put(noteId, stockItemNote);
		entityManager.merge(stockItem);

	}

	public void addImage(Integer itemId, byte[] bytes) {
		StockItem stockItem = getOrCreateStockItem(itemId);
		StockItemImage stockItemImage = new StockItemImage();
		stockItemImage.setImage(bytes);
		stockItem.getImages().add(stockItemImage);
		entityManager.merge(stockItem);
	}

	public StockItemImage getImage(Long imageId) {
		return entityManager.find(StockItemImage.class, imageId);
	}
}
