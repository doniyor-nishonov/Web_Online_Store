package com.pdp.web_online_store.service.picture;

import com.pdp.web_online_store.dao.picture.PictureDAO;
import com.pdp.web_online_store.entity.picture.Picture;
import com.pdp.web_online_store.service.BaseService;

public interface PictureService extends BaseService<Picture, String> {
    PictureDAO pictureDAO = new PictureDAO();
}
