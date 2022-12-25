#include "qmltablemodel.h"

QMLTAbleModel::QMLTAbleModel(QObject *parent): QAbstractTableModel(parent)
{

}

int QMLTAbleModel::rowCount(const QModelIndex& /*index*/) const
{
    return m_data.size();
}

int QMLTAbleModel::columnCount(const QModelIndex& /*index*/) const
{
    return 1;
}

QVariant QMLTAbleModel::data(const QModelIndex &index, int role) const
{
    const int row{ index.row() };
    if (row >= 0 && row < m_data.size()) {
        if (role == QMLTableModelRoles::IdRole)
            return m_data[row].id;
        if (role == QMLTableModelRoles::NameRole)
            return m_data[row].name;
        if (role == QMLTableModelRoles::SurnameRole)
            return m_data[row].surname;
        if (role == QMLTableModelRoles::FriendsRole)
            return m_data[row].friends;
        if (role == Qt::DisplayRole) {
        const int col{ index.column() };
        if (col == 0)
            return m_data[row].id;
        if (col == 1)
            return m_data[row].name;
        if (col == 2)
            return m_data[row].surname;
        }
    }
    return QVariant();
}

QHash<int, QByteArray> QMLTAbleModel::roleNames() const
{
    return
    {
        {QMLTableModelRoles::IdRole, "rowId"},
        {QMLTableModelRoles::NameRole, "name"},
        {QMLTableModelRoles::SurnameRole, "surname"},
        {QMLTableModelRoles::FriendsRole, "friends"}
    };
}

void QMLTAbleModel::appendRowElement(const RowElement &element)
{
    QAbstractTableModel::beginInsertRows(QModelIndex(), m_data.size(), m_data.size() + 1);
    m_data.push_back(element);
    QAbstractTableModel::endInsertRows();
}


