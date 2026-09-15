<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>




<%@ include file="../admin/admin_Header.jsp" %>







    <style>

        .edit-account-container {

            max-width: 900px;

            margin: 30px auto;

            background: #ffffff;

            border-radius: 15px;

            padding: 30px;

            box-shadow:
                0 5px 20px rgba(0, 0, 0, 0.08);
        }


        .edit-account-header {

            margin-bottom: 30px;

            border-bottom: 1px solid #e5e7eb;

            padding-bottom: 20px;
        }


        .edit-account-header h2 {

            margin: 0;

            color: #0b4f82;

            font-size: 25px;
        }


        .edit-account-header p {

            margin-top: 8px;

            color: #718096;

            font-size: 14px;
        }


        .customer-box {

            background: #f5f8fc;

            border: 1px solid #e1e8f0;

            border-radius: 10px;

            padding: 18px;

            margin-bottom: 25px;
        }


        .customer-box h4 {

            margin: 0 0 8px 0;

            color: #24445c;
        }


        .customer-box p {

            margin: 4px 0;

            color: #718096;

            font-size: 14px;
        }


        .form-grid {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 20px;
        }


        .form-group {

            display: flex;

            flex-direction: column;
        }


        .form-group.full-width {

            grid-column: 1 / -1;
        }


        .form-group label {

            margin-bottom: 7px;

            font-size: 13px;

            font-weight: 600;

            color: #43566b;
        }


        .form-group input,

        .form-group select,

        .form-group textarea {

            width: 100%;

            box-sizing: border-box;

            border: 1px solid #d6dee8;

            border-radius: 8px;

            padding: 11px 13px;

            font-size: 14px;

            outline: none;

            background: #ffffff;
        }


        .form-group input:focus,

        .form-group select:focus,

        .form-group textarea:focus {

            border-color: #0866d5;

            box-shadow:
                0 0 0 3px rgba(
                    8,
                    102,
                    213,
                    0.08
                );
        }


        .form-group textarea {

            min-height: 100px;

            resize: vertical;
        }


        .readonly-field {

            background: #f3f4f6 !important;

            color: #6b7280;

            cursor: not-allowed;
        }


        .button-container {

            display: flex;

            justify-content: flex-end;

            gap: 12px;

            margin-top: 30px;

            padding-top: 20px;

            border-top: 1px solid #e5e7eb;
        }


        .btn {

            padding: 11px 20px;

            border-radius: 8px;

            text-decoration: none;

            border: none;

            cursor: pointer;

            font-size: 14px;

            font-weight: 600;
        }


        .btn-cancel {

            background: #eef2f7;

            color: #52667a;
        }


        .btn-update {

            background: #0866d5;

            color: #ffffff;
        }


        .btn-update:hover {

            background: #0755b3;
        }


        @media(max-width: 700px) {

            .form-grid {

                grid-template-columns: 1fr;
            }

            .form-group.full-width {

                grid-column: auto;
            }

        }

    </style>

</head>


<body>


<div class="edit-account-container">


    <!-- ================================= -->
    <!-- HEADER -->
    <!-- ================================= -->

    <div class="edit-account-header">

        <h2>
            Edit Bank Account
        </h2>

        <p>
            Update customer bank account details
        </p>

    </div>


    <!-- ================================= -->
    <!-- CUSTOMER INFORMATION -->
    <!-- ================================= -->

    <div class="customer-box">

        <h4>
            Customer Information
        </h4>


        <p>

            <strong>
                Name:
            </strong>

            ${account.customerName}

        </p>


        <p>

            <strong>
                Email:
            </strong>

            ${account.email}

        </p>


        <p>

            <strong>
                Customer ID:
            </strong>

            ${account.userId}

        </p>

    </div>


    <!-- ================================= -->
    <!-- EDIT FORM -->
    <!-- ================================= -->

    <form
        action="${pageContext.request.contextPath}/admin/bank-account/update"
        method="post">


        <!-- Account ID -->

        <input
            type="hidden"
            name="accountId"
            value="${account.accountId}">


        <div class="form-grid">


            <!-- ================================= -->
            <!-- ACCOUNT NUMBER -->
            <!-- ================================= -->

            <div class="form-group">

                <label>
                    Account Number
                </label>

                <input
                    type="text"
                    name="accountNumber"
                    value="${account.accountNumber}"
                    required>

            </div>


            <!-- ================================= -->
            <!-- ACCOUNT TYPE -->
            <!-- ================================= -->

            <div class="form-group">

                <label>
                    Account Type
                </label>

                <select
                    name="accountType"
                    required>

                    <option
                        value="SAVINGS"
                        ${account.accountType == 'SAVINGS'
                            ? 'selected'
                            : ''}>

                        Savings

                    </option>


                    <option
                        value="CURRENT"
                        ${account.accountType == 'CURRENT'
                            ? 'selected'
                            : ''}>

                        Current

                    </option>

                </select>

            </div>


            <!-- ================================= -->
            <!-- BALANCE -->
            <!-- ================================= -->

            <div class="form-group">

                <label>
                    Balance
                </label>

                <input
                    type="number"
                    name="balance"
                    value="${account.balance}"
                    step="0.01"
                    min="0"
                    required>

            </div>


            <!-- ================================= -->
            <!-- BRANCH -->
            <!-- ================================= -->

            <div class="form-group">

                <label>
                    Branch
                </label>

                <input
                    type="text"
                    name="branch"
                    value="${account.branch}"
                    required>

            </div>


            <!-- ================================= -->
            <!-- IFSC -->
            <!-- ================================= -->

            <div class="form-group">

                <label>
                    IFSC Code
                </label>

                <input
                    type="text"
                    name="ifscCode"
                    value="${account.ifscCode}"
                    required>

            </div>


            <!-- ================================= -->
            <!-- STATUS -->
            <!-- ================================= -->

            <div class="form-group">

                <label>
                    Account Status
                </label>

				<select
				    name="accountStatus"
				    class="form-control"
				    required>

				    <option value="ACTIVE"
				        ${account.accountStatus == 'ACTIVE' ? 'selected' : ''}>
				        ACTIVE
				    </option>

				    <option value="PENDING"
				        ${account.accountStatus == 'PENDING' ? 'selected' : ''}>
				        PENDING
				    </option>

				    <option value="INACTIVE"
				        ${account.accountStatus == 'INACTIVE' ? 'selected' : ''}>
				        INACTIVE
				    </option>

				    <option value="CLOSED"
				        ${account.accountStatus == 'CLOSED' ? 'selected' : ''}>
				        CLOSED
				    </option>

				</select>

            </div>


            <!-- ================================= -->
            <!-- ADMIN REMARKS -->
            <!-- ================================= -->

            <div class="form-group full-width">

                <label>
                    Admin Remarks
                </label>

                <textarea
                    name="adminRemarks"
                    placeholder="Enter admin remarks...">${account.adminRemarks}</textarea>

            </div>


        </div>


        <!-- ================================= -->
        <!-- BUTTONS -->
        <!-- ================================= -->

        <div class="button-container">

            <a
                href="${pageContext.request.contextPath}/admin/bank-account"
                class="btn btn-cancel">

                Cancel

            </a>


            <button
                type="submit"
                class="btn btn-update">

                Update Account

            </button>

        </div>


    </form>


</div>








<%@ include file="../admin/admin_Footer.jsp" %>

