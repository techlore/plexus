const getRatingBg = (rating) => {
  switch (rating) {
    case "1":
      return "bg-red-600";
    case "2":
      return "bg-orange-600";
    case "3":
      return "bg-blue-600";
    case "4":
      return "bg-green-600";
    default:
      return "bg-gray-600";
  }
};

const getRatingText = (rating) => {
  switch (rating) {
    case "1":
      return "text-red-600";
    case "2":
      return "text-orange-600";
    case "3":
      return "text-blue-600";
    case "4":
      return "text-green-600";
    default:
      return "text-gray-600";
  }
};

export { getRatingBg, getRatingText };
