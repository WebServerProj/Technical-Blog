/*
 * package mvc.controller;
 * 
 * import java.io.IOException; import java.util.ArrayList;
 * 
 * import jakarta.servlet.RequestDispatcher; import
 * jakarta.servlet.ServletException; import jakarta.servlet.http.HttpServlet;
 * import jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse;
 * 
 * import mvc.model.MagDAO; import mvc.model.MagDTO;
 * 
 * public class MagController extends HttpServlet { private static final long
 * serialVersionUID = 1L; static final int LISTCOUNT = 5;
 * 
 * public void doGet(HttpServletRequest request, HttpServletResponse response)
 * throws ServletException, IOException { doPost(request, response); }
 * 
 * public void doPost(HttpServletRequest request, HttpServletResponse response)
 * throws ServletException, IOException {
 * 
 * String RequestURI = request.getRequestURI(); String contextPath =
 * request.getContextPath(); String command =
 * RequestURI.substring(contextPath.length());
 * 
 * response.setContentType("text/html; charset=utf-8");
 * request.setCharacterEncoding("utf-8");
 * 
 * if (command.equals("/MagMainAction.do")) { // 메인페이지 이동 (main.jsp)
 * requestBoardList(request); RequestDispatcher rd =
 * request.getRequestDispatcher("../main/main.jsp"); rd.forward(request,
 * response); } else if (command.equals("/MagListAction.do")) { // 내 글 목록페이지
 * requestBoardList(request); RequestDispatcher rd =
 * request.getRequestDispatcher("../checkMyMag/checkMag.jsp");
 * rd.forward(request, response); } else if
 * (command.equals("/MagPageAction.do")) { // 상세정보 페이지
 * requestBoardList(request); RequestDispatcher rd =
 * request.getRequestDispatcher("../main/magazine.jsp"); rd.forward(request,
 * response); } else if (command.equals("/MagAddForm.do")) { // 글 등록 페이지 출력
 * (addMagazine.jsp) requestLoginName(request); RequestDispatcher rd =
 * request.getRequestDispatcher("../add/addMagazine.jsp"); rd.forward(request,
 * response); } else if (command.equals("/MagAddAction.do")) { // 새로운 글 등록 처리
 * (processAddMagazine.jsp) requestBoardWrite(request); RequestDispatcher rd =
 * request.getRequestDispatcher("../add/processAddMagazine.jsp");
 * rd.forward(request, response);
 * 
 * } else if (command.equals("/MagAddSuc.do")) { // 새로운 글 작성 성공 페이지
 * requestBoardWrite(request); RequestDispatcher rd =
 * request.getRequestDispatcher("../add/successAddMag.jsp"); rd.forward(request,
 * response);
 * 
 * } else if (command.equals("/MagSearchSuc.do")) { // 검색성공 페이지
 * requestBoardWrite(request); RequestDispatcher rd =
 * request.getRequestDispatcher("../search/successAddMag.jsp");
 * rd.forward(request, response);
 * 
 * } else if (command.equals("/MagSearchAction.do")) { // 검색 페이지
 * requestBoardWrite(request); RequestDispatcher rd =
 * request.getRequestDispatcher("../add/successAddMag.jsp"); rd.forward(request,
 * response);
 * 
 * } else if (command.equals("/BoardViewAction.do")) { // 선택된 글 상자 페이지 가져오기
 * requestBoardView(request); RequestDispatcher rd =
 * request.getRequestDispatcher("/BoardView.do"); rd.forward(request, response);
 * } else if (command.equals("/MagView.do")) { // 글 상세 페이지 출 RequestDispatcher
 * rd = request.getRequestDispatcher("./board/view.jsp"); rd.forward(request,
 * response); } else if (command.equals("/BoardUpdateAction.do")) { // 선택된 글
 * 수정하기 requestBoardUpdate(request); RequestDispatcher rd =
 * request.getRequestDispatcher("/BoardListAction.do"); rd.forward(request,
 * response); } else if (command.equals("/BoardDeleteAction.do")) { // 선택된 글
 * 삭제하기 requestBoardDelete(request); RequestDispatcher rd =
 * request.getRequestDispatcher("/BoardListAction.do"); rd.forward(request,
 * response); } }
 * 
 * // 등록된 글 목록 가져오기 public void requestBoardList(HttpServletRequest request) {
 * 
 * MagDAO dao = MagDAO.getInstance(); ArrayList<MagDAO> boardlist = new
 * ArrayList<MagDAO>();
 * 
 * int pageNum = 1; int limit = LISTCOUNT;
 * 
 * if (request.getParameter("pageNum") != null) pageNum =
 * Integer.parseInt(request.getParameter("pageNum"));
 * 
 * String items = request.getParameter("items"); String text =
 * request.getParameter("text");
 * 
 * int total_record = dao.getListCount(items, text); boardlist =
 * dao.getBoardList(pageNum, limit, items, text);
 * 
 * int total_page;
 * 
 * if (total_record % limit == 0) { total_page = total_record / limit;
 * Math.floor(total_page); } else { total_page = total_record / limit;
 * Math.floor(total_page); total_page = total_page + 1; }
 * 
 * request.setAttribute("pageNum", pageNum); request.setAttribute("total_page",
 * total_page); request.setAttribute("total_record", total_record);
 * request.setAttribute("boardlist", boardlist); }
 * 
 * // 인증된 사용자명 가져오기 public void requestLoginName(HttpServletRequest request) {
 * 
 * String id = request.getParameter("id");
 * 
 * MagDAO dao = MagDAO.getInstance();
 * 
 * String name = dao.getLoginNameById(id);
 * 
 * request.setAttribute("name", name); }
 * 
 * // 새로운 글 등록하기 public void requestBoardWrite(HttpServletRequest request) {
 * 
 * MagDAO dao = MagDAO.getInstance();
 * 
 * MagDTO board = new MagDTO(); board.setId(request.getParameter("id"));
 * board.setName(request.getParameter("name"));
 * board.setEmail(request.getParameter("email"));
 * board.setPhone1(request.getParameter("phone1"));
 * board.setPhone2(request.getParameter("phone2"));
 * board.setPhone3(request.getParameter("phone3"));
 * //board.setPw(request.getParameter("pw")); ? pw는 비밀번호인데 과연 가져와야할까?
 * 
 * System.out.println(request.getParameter("id"));
 * System.out.println(request.getParameter("name"));
 * System.out.println(request.getParameter("email"));
 * System.out.println(request.getParameter("phone1"));
 * System.out.println(request.getParameter("phone2"));
 * System.out.println(request.getParameter("phone3"));
 * java.text.SimpleDateFormat formatter = new
 * java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)"); String regist_day =
 * formatter.format(new java.util.Date());
 * 
 * board.setHit(0); board.setRegist_day(regist_day);
 * board.setIp(request.getRemoteAddr());
 * 
 * dao.insertBoard(board); }
 * 
 * // 선택된 글 상세 페이지 가져오기 public void requestBoardView(HttpServletRequest request)
 * {
 * 
 * MagDAO dao = MagDAO.getInstance(); int num =
 * Integer.parseInt(request.getParameter("num")); int pageNum =
 * Integer.parseInt(request.getParameter("pageNum"));
 * 
 * MagDTO board = new MagDTO(); board = dao.getBoardByNum(num, pageNum);
 * 
 * request.setAttribute("num", num); request.setAttribute("page", pageNum);
 * request.setAttribute("board", board); }
 * 
 * // 선택된 글 내용 수정하기 public void requestBoardUpdate(HttpServletRequest request) {
 * 
 * int num = Integer.parseInt(request.getParameter("num")); int pageNum =
 * Integer.parseInt(request.getParameter("pageNum"));
 * 
 * MagDAO dao = MagDAO.getInstance();
 * 
 * MagDTO board = new MagDTO(); board.setNum(num);
 * board.setName(request.getParameter("name"));
 * board.setSubject(request.getParameter("subject"));
 * board.setContent(request.getParameter("content"));
 * 
 * java.text.SimpleDateFormat formatter = new
 * java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)"); String regist_day =
 * formatter.format(new java.util.Date());
 * 
 * board.setHit(0); board.setRegist_day(regist_day);
 * board.setIp(request.getRemoteAddr());
 * 
 * dao.updateBoard(board); }
 * 
 * // 선택된 글 삭제하기 public void requestBoardDelete(HttpServletRequest request) {
 * 
 * int num = Integer.parseInt(request.getParameter("num")); int pageNum =
 * Integer.parseInt(request.getParameter("pageNum"));
 * 
 * MagDAO dao = MagDAO.getInstance(); dao.deleteBoard(num); } }
 */