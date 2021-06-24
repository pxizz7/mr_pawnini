package com.pawnini.model.product_inq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.product_inq.Inq_repDTO;
import com.pawnini.model.product_inq.Inq_repService;


@Service("inq_repService")
public class Inq_repServiceImpl implements Inq_repService {

		@Autowired
		private Inq_repDAO inq_repDAO;
		
		@Override
		public void insertInq_rep(Inq_repDTO dto) throws Exception {
			inq_repDAO.insertInq_rep(dto);
		}

		@Override
		public void updateInq_rep(Inq_repDTO dto) throws Exception {
			inq_repDAO.updateInq_rep(dto);
		}

		@Override
		public void deleteInq_rep(Inq_repDTO dto) throws Exception {
			inq_repDAO.deleteInq_rep(dto);
		}

		@Override
		public List<Inq_repDTO> getInq_repList(int inq_rep_id) throws Exception {
			return inq_repDAO.getInq_repList(inq_rep_id);
		}

		@Override
		public Inq_repDTO getInq_rep(int inq_rep_id) throws Exception {
			return inq_repDAO.getInq_rep(inq_rep_id);
		}
}