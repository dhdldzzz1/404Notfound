import React from "react";
import BoardPage from "./JHWFORM/BoardPage.jsx";
import WritePage from "./JHWFORM/WritePage.jsx";
import ViewPage from "./JHWFORM/ViewPage.jsx";

function App() {
  return (
    <div>
      {/* 필요에 따라 라우팅 또는 조건부 렌더링 */}
      <BoardPage />
      {/* <WritePage /> */}
      {/* <ViewPage /> */}
    </div>
  );
}

export default App;
