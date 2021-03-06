package com.iot.test.service.impl;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iot.test.mapper.ImgMapper;
import com.iot.test.service.ImageService;
import com.iot.test.vo.ImageVO;

import javax.servlet.http.HttpServletRequest;

@Service
public class ImageServiceImpl implements ImageService {

	private static final Logger log = LoggerFactory.getLogger(ImageServiceImpl.class);

	@Autowired
	ImgMapper im;

	@Autowired
	ImageServiceImpl imageService;

	@Autowired
	BoardServiceImpl boardService;

	@Autowired
	UserInfoServiceImpl userService;

	@Autowired
	BoardCommentServiceImpl boardComentService;

	@Autowired
	BoardHitServiceImpl boardHitService;

	@Autowired
	BoardRecommandServiceImpl boardRecommandService;

	@Value("${image.upload.file.path}")
	public String IMAGE_DIR;
	
	@Override
	public List<ImageVO> ImgList() {

		return im.ImgList();
	}

	@Override
	public List<ImageVO> selectByBno(int bNo) {

		return im.selectByBno(bNo);
	}

	@Override
	public void insertImg(List<MultipartFile> images, int bNo) {

		for (MultipartFile img : images) {
			if (img.getSize() != 0) {
				ImageVO ImageVO = save(img, bNo);
				im.insertImg(ImageVO);
			}
		}
	}

	@Override
	public int deleteImg(int bNo) {

		return im.deleteImgByBNo(bNo);
	}

	@Override
	public void updateImg(List<ImageVO> imageVOList, List<Integer> imgNoList) {

	}

	public void updateImg(List<ImageVO> imageVOList, List<Integer> imgNoList, HttpServletRequest request) {
		List<ImageVO> refinedList = imageVOList;
		for (int i = 0; i < imageVOList.size(); i++) {
			ImageVO iv = imageVOList.get(i);
			for (Integer imgNo : imgNoList) {
				if (iv.getImgNo() == imgNo) {
					refinedList.remove(i);
				}
			}
		}
		for (ImageVO iv : refinedList) {
			File imgF = new File(request.getSession().getServletContext().getRealPath(IMAGE_DIR), iv.getImgId());
			imgF.delete();
			im.deleteImgByImgId(iv.getImgId());
		}
	}

	/**
	 * Multipart File??? ????????? ???????????? DB(??? ????????? ???)??? ????????? ?????? ?????? ??????
	 */
	public ImageVO save(MultipartFile multipartFile, int bNo) {
		// UUID??? ????????? ??? ?????? ??? ??????.. ?????? ????????? ?????? ???????????? ??????
		String genId = UUID.randomUUID().toString();
		String imgId = null;
		try {
			imgId = saveToFile(multipartFile, genId);
		} catch (IOException e) {
			e.printStackTrace();
		}
		ImageVO iv = new ImageVO();
		iv.setImgId(imgId);
		iv.setImgType(multipartFile.getContentType());
		iv.setImgSize((int) multipartFile.getSize());
		iv.setImgName(multipartFile.getOriginalFilename());
		iv.setbNo(bNo);
		return iv;

	}

	/**
	 * Multipart File??? ????????? ????????? ??????, ?????? ??? ????????? ?????? ????????? ??????
	 */
	public String saveToFile(MultipartFile src, String id) throws IOException {
		String fileName = src.getOriginalFilename();
		byte[] bytes = src.getBytes();
		String saveFileName = id + "." + getExtension(fileName);
		String savePath = IMAGE_DIR + saveFileName;

		/* ?????? ?????? */
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(savePath));
		bos.write(bytes);
		bos.flush();
		bos.close();
		return saveFileName;
	}

	/**
	 * ???????????????????????? ???????????? ???????????? ????????? ??????????????? ????????? ????????? ?????? . ????????? ?????????. ?????? ?????? ?????? ????????? ???????????? ""??? ??????
	 */
	public String getExtension(String fileName) {
		int dotPosition = fileName.lastIndexOf('.');

		if (-1 != dotPosition && fileName.length() - 1 > dotPosition) {
			return fileName.substring(dotPosition + 1);
		} else {
			return "";
		}
	}

}
